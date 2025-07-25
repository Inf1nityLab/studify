-- =====================================================
-- Схема базы данных для системы регистрации на основе ролей
-- =====================================================

-- Создание схемы
CREATE SCHEMA IF NOT EXISTS users;

-- Создание таблицы пользователей
CREATE TABLE users.users (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  phone_number text,
  email text unique not null,
  role text not null check (role in ('ceo', 'manager', 'teacher', 'student')),
  is_active boolean default true,
  created_at timestamp with time zone default timezone('utc', now()),
  updated_at timestamp with time zone default timezone('utc', now())
);

-- Включение Row Level Security (RLS)
ALTER TABLE users.users ENABLE ROW LEVEL SECURITY;

-- Политики безопасности для таблицы users

-- Пользователи могут просматривать только свой профиль
CREATE POLICY "Users can view their own profile" ON users.users
FOR SELECT USING (auth.uid() = id);

-- Пользователи могут создавать только свой профиль
CREATE POLICY "Users can insert their own profile" ON users.users
FOR INSERT WITH CHECK (auth.uid() = id);

-- Пользователи могут обновлять только свой профиль
CREATE POLICY "Users can update their own profile" ON users.users
FOR UPDATE USING (auth.uid() = id);

-- Функция для автоматического обновления поля updated_at
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = timezone('utc', now());
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Триггер для автоматического обновления updated_at при изменении записи
CREATE TRIGGER update_users_updated_at 
BEFORE UPDATE ON users.users 
FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Создание индексов для оптимизации запросов
CREATE INDEX idx_users_email ON users.users(email);
CREATE INDEX idx_users_role ON users.users(role);
CREATE INDEX idx_users_is_active ON users.users(is_active);
CREATE INDEX idx_users_created_at ON users.users(created_at);

-- Комментарии к таблице и колонкам
COMMENT ON TABLE users.users IS 'Таблица пользователей системы';
COMMENT ON COLUMN users.users.id IS 'Уникальный идентификатор пользователя';
COMMENT ON COLUMN users.users.name IS 'Полное имя пользователя';
COMMENT ON COLUMN users.users.phone_number IS 'Номер телефона (опционально)';
COMMENT ON COLUMN users.users.email IS 'Email адрес (уникальный)';
COMMENT ON COLUMN users.users.role IS 'Роль пользователя в системе';
COMMENT ON COLUMN users.users.is_active IS 'Статус активности пользователя';
COMMENT ON COLUMN users.users.created_at IS 'Дата и время создания записи';
COMMENT ON COLUMN users.users.updated_at IS 'Дата и время последнего обновления';

-- =====================================================
-- Дополнительные функции для работы с пользователями
-- =====================================================

-- Функция для получения пользователя по email
CREATE OR REPLACE FUNCTION get_user_by_email(user_email text)
RETURNS TABLE (
  id uuid,
  name text,
  phone_number text,
  email text,
  role text,
  is_active boolean,
  created_at timestamp with time zone,
  updated_at timestamp with time zone
) AS $$
BEGIN
  RETURN QUERY
  SELECT u.id, u.name, u.phone_number, u.email, u.role, u.is_active, u.created_at, u.updated_at
  FROM users.users u
  WHERE u.email = user_email;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Функция для получения пользователей по роли
CREATE OR REPLACE FUNCTION get_users_by_role(user_role text)
RETURNS TABLE (
  id uuid,
  name text,
  phone_number text,
  email text,
  role text,
  is_active boolean,
  created_at timestamp with time zone,
  updated_at timestamp with time zone
) AS $$
BEGIN
  RETURN QUERY
  SELECT u.id, u.name, u.phone_number, u.email, u.role, u.is_active, u.created_at, u.updated_at
  FROM users.users u
  WHERE u.role = user_role AND u.is_active = true;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- =====================================================
-- Тестовые данные (опционально)
-- =====================================================

-- Вставка тестовых пользователей (раскомментируйте при необходимости)
/*
INSERT INTO users.users (name, email, role, phone_number) VALUES
('Иван Петров', 'ivan@example.com', 'ceo', '+7 (999) 123-45-67'),
('Мария Сидорова', 'maria@example.com', 'manager', '+7 (999) 234-56-78'),
('Алексей Козлов', 'alex@example.com', 'teacher', '+7 (999) 345-67-89'),
('Анна Волкова', 'anna@example.com', 'student', '+7 (999) 456-78-90');
*/

-- =====================================================
-- Проверка созданной схемы
-- =====================================================

-- Проверка таблицы
SELECT 
  table_name,
  column_name,
  data_type,
  is_nullable,
  column_default
FROM information_schema.columns 
WHERE table_schema = 'users' AND table_name = 'users'
ORDER BY ordinal_position;

-- Проверка политик RLS
SELECT 
  schemaname,
  tablename,
  policyname,
  permissive,
  roles,
  cmd,
  qual,
  with_check
FROM pg_policies 
WHERE schemaname = 'users' AND tablename = 'users'; 