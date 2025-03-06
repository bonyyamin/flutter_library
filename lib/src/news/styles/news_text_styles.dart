import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Optional, for modern typography

class NewsTextStyles {
  // Headline styles (for news titles)
  static TextStyle headline1({bool isDarkMode = false}) => GoogleFonts.merriweather(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: isDarkMode ? Colors.white : Colors.black87,
      );

  static TextStyle headline2({bool isDarkMode = false}) => GoogleFonts.merriweather(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: isDarkMode ? Colors.white70 : Colors.black87,
      );

  // Body text styles (for news content)
  static TextStyle bodyText1({bool isDarkMode = false}) => GoogleFonts.openSans(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: isDarkMode ? Colors.white70 : Colors.black87,
        height: 1.5, // Improves readability
      );

  static TextStyle bodyText2({bool isDarkMode = false}) => GoogleFonts.openSans(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: isDarkMode ? Colors.white60 : Colors.black54,
        height: 1.5,
      );

  // Caption and small text
  static TextStyle caption({bool isDarkMode = false}) => GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.w300,
        color: isDarkMode ? Colors.white54 : Colors.black54,
      );

  // Button text
  static TextStyle button({bool isDarkMode = false}) => GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: isDarkMode ? Colors.white : Colors.white,
      );

  // Overline (for small category tags, timestamps)
  static TextStyle overline({bool isDarkMode = false}) => GoogleFonts.roboto(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.5,
        color: isDarkMode ? Colors.white54 : Colors.black54,
      );

  // Function to get text themes dynamically
  static TextTheme getTextTheme({bool isDarkMode = false}) {
    return TextTheme(
      displayLarge: headline1(isDarkMode: isDarkMode),
      displayMedium: headline2(isDarkMode: isDarkMode),
      bodyLarge: bodyText1(isDarkMode: isDarkMode),
      bodyMedium: bodyText2(isDarkMode: isDarkMode),
      labelLarge: button(isDarkMode: isDarkMode),
      titleSmall: caption(isDarkMode: isDarkMode),
      labelSmall: overline(isDarkMode: isDarkMode),
    );
  }
}


/*
final textTheme = NewsTextStyles.getTextTheme(isDarkMode: true);
*/