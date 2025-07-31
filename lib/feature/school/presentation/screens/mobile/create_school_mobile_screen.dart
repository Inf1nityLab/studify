import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/widgets/mobile_animation_mixin.dart';
import '../../../../../core/widgets/animated_text_widget.dart';
import '../../../../../core/widgets/animated_form_widget.dart';
import '../../widgets/create_school_form.dart';
import '../../widgets/create_school_controller.dart';

class CreateSchoolMobileScreen extends StatefulWidget {
  final CreateSchoolController controller;
  
  const CreateSchoolMobileScreen({
    super.key,
    required this.controller,
  });

  @override
  State<CreateSchoolMobileScreen> createState() => _CreateSchoolMobileScreenState();
}

class _CreateSchoolMobileScreenState extends State<CreateSchoolMobileScreen>
    with TickerProviderStateMixin, MobileAnimationMixin {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: slideAnimation,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 40),

                                    // Заголовок с анимацией
                  AnimatedTextWidget(
                    text: l10n.createSchool,
                    animation: fadeAnimation,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: theme.colorScheme.onSurface,
                      letterSpacing: 1.0,
                    ),
                    textAlign: TextAlign.center,
                    slideOffset: 20.0,
                    delay: 0.0,
                  ),

                  const SizedBox(height: 8),

                  // Подзаголовок с задержкой
                  AnimatedTextWidget(
                    text: l10n.createSchoolSubtitle,
                    animation: fadeAnimation,
                    style: TextStyle(
                      fontSize: 16,
                      color: theme.colorScheme.onSurface.withOpacity(0.6),
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                    slideOffset: 15.0,
                    delay: 0.2,
                  ),

                    const SizedBox(height: 40),

                  // Общая форма создания школы с анимацией
                  AnimatedFormWidget(
                    animation: fadeAnimation,
                    child: CreateSchoolForm(
                      isDesktop: false,
                      controller: widget.controller,
                    ),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
        ),
      ),
    );
  }
} 