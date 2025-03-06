import 'package:flutter/material.dart';
import 'news_colors.dart';
import 'news_text_styles.dart';
import 'news_button_styles.dart';
import 'news_appbar_styles.dart';

class NewsTheme {
  // Get the full theme dynamically based on dark mode
  static ThemeData getTheme({bool isDarkMode = false}) {
    return ThemeData(
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      primaryColor: NewsColors.primary,
      scaffoldBackgroundColor: isDarkMode ? NewsColors.backgroundDark : NewsColors.backgroundLight,
      colorScheme: ColorScheme.fromSeed(
        seedColor: NewsColors.primary,
        background: isDarkMode ? NewsColors.backgroundDark : NewsColors.backgroundLight,
      ),
      cardColor: isDarkMode ? NewsColors.surfaceDark : NewsColors.surfaceLight,
      dividerColor: isDarkMode ? NewsColors.dividerDark : NewsColors.dividerLight,
      
      // Text theme
      textTheme: NewsTextStyles.getTextTheme(isDarkMode: isDarkMode),

      // AppBar theme
      appBarTheme: NewsAppBarStyles.appBarTheme(isDarkMode: isDarkMode),

      // Button themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: NewsButtonStyles.elevatedButton(isDarkMode: isDarkMode),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: NewsButtonStyles.outlinedButton(isDarkMode: isDarkMode),
      ),
      textButtonTheme: TextButtonThemeData(
        style: NewsButtonStyles.textButton(isDarkMode: isDarkMode),
      ),

      // Icon theme
      iconTheme: IconThemeData(
        color: isDarkMode ? NewsColors.textPrimaryDark : NewsColors.textPrimaryLight,
      ),

      // SnackBar theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: isDarkMode ? NewsColors.surfaceDark : NewsColors.surfaceLight,
        contentTextStyle: TextStyle(
          color: isDarkMode ? Colors.white : Colors.black87,
        ),
      ),
    );
  }
}



//Apply Light Theme
/*
MaterialApp(
  theme: NewsTheme.getTheme(isDarkMode: false),
  home: NewsHomePage(),
);
*/

//Apply Dark Theme
/*
MaterialApp(
  theme: NewsTheme.getTheme(isDarkMode: true),
  home: NewsHomePage(),
);
*/