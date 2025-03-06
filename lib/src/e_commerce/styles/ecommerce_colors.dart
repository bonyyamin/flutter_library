import 'package:flutter/material.dart';

/// Defines the color palette for the eCommerce app.
class EcommerceColors {
  // Primary Brand Colors
  static const Color primary = Color(0xFF2A9D8F); // Teal Green
  static const Color secondary = Color(0xFFE76F51); // Burnt Orange

  // Accent Colors
  static const Color accent = Color(0xFFF4A261); // Warm Yellow-Orange
  static const Color highlight = Color(0xFF264653); // Deep Navy Blue

  // Background Colors
  static const Color background = Color(0xFFFAFAFA); // Light Grey
  static const Color cardBackground = Color(0xFFFFFFFF); // White
  static const Color inputBackground = Color(
    0xFFF0F0F0,
  ); // Light Grey for Input Fields

  // Text Colors
  static const Color textPrimary = Color(0xFF333333); // Dark Grey (Headings)
  static const Color textSecondary = Color(
    0xFF666666,
  ); // Medium Grey (Body Text)
  static const Color textHint = Color(0xFF999999); // Light Grey for Hints

  // Success, Warning, and Error Colors
  static const Color success = Color(0xFF27AE60); // Green for Success Messages
  static const Color warning = Color(0xFFF2C94C); // Yellow for Warnings
  static const Color error = Color(0xFFEB5757); // Red for Errors

  // Button Colors
  static const Color buttonPrimary = primary;
  static const Color buttonSecondary = secondary;
  static const Color buttonDisabled = Color(0xFFBDBDBD); // Greyed-out buttons

  // Borders & Dividers
  static const Color border = Color(0xFFE0E0E0); // Light grey border
  static const Color divider = Color(0xFFBDBDBD); // Medium grey divider

  /// Generate a color with adjusted opacity
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }

  /// Generate a dynamic color for light & dark themes
  static Color dynamicColor(BuildContext context, {Color? light, Color? dark}) {
    return Theme.of(context).brightness == Brightness.dark
        ? (dark ?? textPrimary)
        : (light ?? textSecondary);
  }
}
