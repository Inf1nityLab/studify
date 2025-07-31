import 'package:flutter/material.dart';

abstract class AppLocalizations {
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  // App
  String get appName;
  String get appVersion;
  String get appSubtitle;

  // Settings
  String get settings;
  String get appearance;
  String get language;
  String get switchToLightTheme;
  String get switchToDarkTheme;
  String get currentTheme;
  String get lightTheme;
  String get darkTheme;
  String get systemTheme;
  String get goToSignIn;

  // Auth
  String get signIn;
  String get signUp;
  String get welcome;
  String get createAccount;
  String get signInSubtitle;
  String get signUpSubtitle;
  String get email;
  String get password;
  String get confirmPassword;
  String get fullName;
  String get forgotPassword;
  String get forgotPasswordSubtitle;
  String get sendInstructions;
  String get emailSentTitle;
  String get emailSentSubtitle;
  String get emailSentCheck;
  String get rememberPassword;
  String get rememberMe;
  String get noAccount;
  String get haveAccount;
  String get signInButton;
  String get signUpButton;
  String get createAccountButton;
  String get agreeToTerms;
  String get termsAndPolicy;

  // Validation
  String get emailRequired;
  String get emailInvalid;
  String get passwordRequired;
  String get passwordMinLength;
  String get passwordsNotMatch;
  String get nameRequired;
  String get nameMinLength;

  // Navigation
  String get backToHome;
  String get pageNotFound;
  
  // Navigation Items
  String get schedule;
  String get statistics;
  String get createGroup;
  String get video;
  String get profile;
  String get school;
  String get studio;
  
  // Navigation UI
  String get backToSettings;
  String get sidebarCollapse;
  String get sidebarExpand;
  String get logout;
  String get educationFuture;

  // School Creation
  String get createSchool;
  String get createSchoolSubtitle;
  String get schoolName;
  String get schoolNameHint;
  String get schoolNameRequired;
  String get selectSubjects;
  String get selectDirections;
  String get noSubjectsSelected;
  String get noDirectionsSelected;
  String get subjectsCount;
  String get directionsCount;
  String get learningType;
  String get online;
  String get offline;
  String get schoolAddress;
  String get schoolAddressHint;
  String get schoolAddressRequired;
  String get numberOfRooms;
  String get numberOfRoomsHint;
  String get numberOfRoomsRequired;
  String get numberOfRoomsInvalid;
  String get logo;
  String get selectLogo;
  String get uploadImage;
  String get cancel;
  String get schoolCreatedSuccess;
  String get createSchoolButton;

  // Dialog
  String get search;
  String get selected;
  String get done;
} 