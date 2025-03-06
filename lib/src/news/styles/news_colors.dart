import 'package:flutter/material.dart';

class NewsColors {
  // Primary and secondary colors
  static const Color primary = Color(0xFF1E88E5); // Bright blue for headlines
  static const Color secondary = Color(0xFFF4511E); // Vibrant red for highlights
  static const Color accent = Color(0xFFFFC107); // Warm yellow for emphasis

  // Background and surface colors
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF121212);
  
  static const Color surfaceLight = Color(0xFFF5F5F5);
  static const Color surfaceDark = Color(0xFF1E1E1E);

  // Text colors
  static const Color textPrimaryLight = Color(0xFF212121);
  static const Color textSecondaryLight = Color(0xFF757575);
  
  static const Color textPrimaryDark = Color(0xFFE0E0E0);
  static const Color textSecondaryDark = Color(0xFFB0B0B0);

  // Error and success colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);

  // Divider and border colors
  static const Color dividerLight = Color(0xFFBDBDBD);
  static const Color dividerDark = Color(0xFF424242);

  // Function to get colors based on theme mode
  static ThemeData getTheme({bool isDarkMode = false}) {
    return ThemeData(
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      primaryColor: primary,
      scaffoldBackgroundColor: isDarkMode ? backgroundDark : backgroundLight,
      cardColor: isDarkMode ? surfaceDark : surfaceLight,
      dividerColor: isDarkMode ? dividerDark : dividerLight,
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: isDarkMode ? textPrimaryDark : textPrimaryLight,
        ),
        bodyMedium: TextStyle(
          color: isDarkMode ? textSecondaryDark : textSecondaryLight,
        ),
      ),
      iconTheme: IconThemeData(
        color: isDarkMode ? textPrimaryDark : textPrimaryLight,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(error: error),
    );
  }
}


/*
final theme = NewsColors.getTheme(isDarkMode: true);
*/