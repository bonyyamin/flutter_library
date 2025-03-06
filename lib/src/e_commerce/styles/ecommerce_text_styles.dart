import 'package:flutter/material.dart';
import 'ecommerce_colors.dart';

/// Defines the typography styles for the eCommerce app.
class EcommerceTextStyles {
  // Headline Styles (Used for titles, product names, etc.)
  static const TextStyle headline1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: EcommerceColors.textPrimary,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: EcommerceColors.textPrimary,
  );

  static const TextStyle headline3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: EcommerceColors.textPrimary,
  );

  // Subtitles (Used for secondary headings, card titles, etc.)
  static const TextStyle subtitle1 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: EcommerceColors.textSecondary,
  );

  static const TextStyle subtitle2 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: EcommerceColors.textSecondary,
  );

  // Body Text (Used for general content)
  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: EcommerceColors.textPrimary,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: EcommerceColors.textSecondary,
  );

  // Caption (Used for small hints, labels, descriptions)
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: EcommerceColors.textHint,
  );

  // Button Text
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white, // Default button text color
  );

  /// Dynamic Text Style (Adapts to Light & Dark mode)
  static TextStyle dynamicStyle(BuildContext context, {TextStyle? light, TextStyle? dark}) {
    return Theme.of(context).brightness == Brightness.dark ? (dark ?? bodyText1) : (light ?? bodyText2);
  }
}
