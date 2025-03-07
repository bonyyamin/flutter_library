import 'package:flutter/material.dart';
import 'ecommerce_colors.dart';
import 'ecommerce_text_styles.dart';

/// Defines the theme for the eCommerce app.
class EcommerceTheme {
  /// Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: EcommerceColors.primary,
    scaffoldBackgroundColor: EcommerceColors.background,
    cardColor: EcommerceColors.cardBackground,
    textTheme: const TextTheme(
      displayLarge: EcommerceTextStyles.headline1,
      displayMedium: EcommerceTextStyles.headline2,
      displaySmall: EcommerceTextStyles.headline3,
      titleMedium: EcommerceTextStyles.subtitle1,
      titleSmall: EcommerceTextStyles.subtitle2,
      bodyLarge: EcommerceTextStyles.bodyText1,
      bodyMedium: EcommerceTextStyles.bodyText2,
      labelSmall: EcommerceTextStyles.caption,
      labelLarge: EcommerceTextStyles.button,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: EcommerceColors.primary,
      foregroundColor: Colors.white,
      elevation: 2,
      titleTextStyle: EcommerceTextStyles.headline3,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: EcommerceColors.buttonPrimary,
      disabledColor: EcommerceColors.buttonDisabled,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(EcommerceColors.buttonPrimary),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 14, horizontal: 20)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(EcommerceColors.primary),
        side: WidgetStatePropertyAll(BorderSide(color: EcommerceColors.primary, width: 2)),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 14, horizontal: 20)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: EcommerceColors.inputBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: EcommerceColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: EcommerceColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: EcommerceColors.primary, width: 2),
      ),
      hintStyle: EcommerceTextStyles.caption,
    ),
  );

  /// Dark Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: EcommerceColors.primary,
    scaffoldBackgroundColor: EcommerceColors.highlight,
    cardColor: EcommerceColors.textPrimary,
    textTheme: const TextTheme(
      displayLarge: EcommerceTextStyles.headline1,
      displayMedium: EcommerceTextStyles.headline2,
      displaySmall: EcommerceTextStyles.headline3,
      titleMedium: EcommerceTextStyles.subtitle1,
      titleSmall: EcommerceTextStyles.subtitle2,
      bodyLarge: EcommerceTextStyles.bodyText1,
      bodyMedium: EcommerceTextStyles.bodyText2,
      labelSmall: EcommerceTextStyles.caption,
      labelLarge: EcommerceTextStyles.button,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: EcommerceColors.primary,
      foregroundColor: Colors.white,
      elevation: 2,
      titleTextStyle: EcommerceTextStyles.headline3,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: EcommerceColors.buttonPrimary,
      disabledColor: EcommerceColors.buttonDisabled,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(EcommerceColors.buttonPrimary),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 14, horizontal: 20)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(EcommerceColors.accent),
        side: WidgetStatePropertyAll(BorderSide(color: EcommerceColors.accent, width: 2)),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 14, horizontal: 20)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: EcommerceColors.textSecondary,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: EcommerceColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: EcommerceColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: EcommerceColors.accent, width: 2),
      ),
      hintStyle: EcommerceTextStyles.caption,
    ),
  );
}


//how to use this theme

/*MaterialApp(
  theme: EcommerceTheme.lightTheme,
  darkTheme: EcommerceTheme.darkTheme,
  themeMode: ThemeMode.system, // Auto-switch based on system setting
  home: YourHomePage(),
);*/


/*
Key Features of This Code:
✅ Light & Dark Mode Support – Seamlessly switches between themes.
✅ Typography Integration – Uses ecommerce_text_styles.dart for consistent fonts.
✅ UI Consistency – Standardizes AppBar, Buttons, TextFields, and Cards.
✅ Easily Customizable – Modify colors, borders, or fonts as needed.
*/