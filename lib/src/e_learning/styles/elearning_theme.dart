import 'package:flutter/material.dart';

import 'elearning_colors.dart';
import 'elearning_text_styles.dart';
import 'elearning_button_styles.dart';
import 'elearning_card_styles.dart';
import 'elearning_progress_indicator_styles.dart';

/// Defines the overall theme for the eLearning module.
class ELearningTheme {
  /// Light theme configuration
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: ELearningColors.light.primary,
    scaffoldBackgroundColor: ELearningColors.light.background,
    colorScheme: ColorScheme.light(
      primary: ELearningColors.light.primary,
      secondary: ELearningColors.light.secondary,
      background: ELearningColors.light.background,
      surface: ELearningColors.light.surface,
      error: ELearningColors.light.error,
    ),
    textTheme: TextTheme(
      displayLarge: ELearningTextStyles.light.headline1,
      displayMedium: ELearningTextStyles.light.headline2,
      displaySmall: ELearningTextStyles.light.headline3,
      bodyLarge: ELearningTextStyles.light.bodyText1,
      bodyMedium: ELearningTextStyles.light.bodyText2,
      titleMedium: ELearningTextStyles.light.subtitle1,
      titleSmall: ELearningTextStyles.light.subtitle2,
      labelLarge: ELearningTextStyles.light.button,
      bodySmall: ELearningTextStyles.light.caption,
      labelSmall: ELearningTextStyles.light.overline,
    ),
    extensions: [
      ELearningColors.light,
      ELearningTextStyles.light,
      ELearningButtonStyles.light,
      ELearningCardStyles.light,
      ELearningProgressIndicatorStyles.light,
    ],
  );

  /// Dark theme configuration
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ELearningColors.dark.primary,
    scaffoldBackgroundColor: ELearningColors.dark.background,
    colorScheme: ColorScheme.dark(
      primary: ELearningColors.dark.primary,
      secondary: ELearningColors.dark.secondary,
      background: ELearningColors.dark.background,
      surface: ELearningColors.dark.surface,
      error: ELearningColors.dark.error,
    ),
    textTheme: TextTheme(
      displayLarge: ELearningTextStyles.dark.headline1,
      displayMedium: ELearningTextStyles.dark.headline2,
      displaySmall: ELearningTextStyles.dark.headline3,
      bodyLarge: ELearningTextStyles.dark.bodyText1,
      bodyMedium: ELearningTextStyles.dark.bodyText2,
      titleMedium: ELearningTextStyles.dark.subtitle1,
      titleSmall: ELearningTextStyles.dark.subtitle2,
      labelLarge: ELearningTextStyles.dark.button,
      bodySmall: ELearningTextStyles.dark.caption,
      labelSmall: ELearningTextStyles.dark.overline,
    ),
    extensions: [
      ELearningColors.dark,
      ELearningTextStyles.dark,
      ELearningButtonStyles.dark,
      ELearningCardStyles.dark,
      ELearningProgressIndicatorStyles.dark,
    ],
  );
}


//usage example of Applying the theme
/*
MaterialApp(
  theme: ELearningTheme.light, 
  darkTheme: ELearningTheme.dark, 
  themeMode: ThemeMode.system, // Auto-switch based on system preference
  home: YourHomePage(),
)
*/