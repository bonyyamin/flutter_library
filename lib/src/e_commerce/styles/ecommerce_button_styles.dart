import 'package:flutter/material.dart';
import 'ecommerce_colors.dart';

/// Defines button styles for the eCommerce app.
class EcommerceButtonStyles {
  // Primary Button (Used for main actions)
  static final ButtonStyle primary = ElevatedButton.styleFrom(
    backgroundColor: EcommerceColors.buttonPrimary,
    foregroundColor: Colors.white,
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  // Secondary Button (Alternative actions)
  static final ButtonStyle secondary = ElevatedButton.styleFrom(
    backgroundColor: EcommerceColors.buttonSecondary,
    foregroundColor: Colors.white,
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  // Outline Button (Minimal look)
  static final ButtonStyle outline = OutlinedButton.styleFrom(
    foregroundColor: EcommerceColors.primary,
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    side: const BorderSide(color: EcommerceColors.primary, width: 2),
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  // Disabled Button (For inactive states)
  static final ButtonStyle disabled = ElevatedButton.styleFrom(
    backgroundColor: EcommerceColors.buttonDisabled,
    foregroundColor: Colors.white,
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  /// Dynamic Button Style (Adapts to Light & Dark mode)
  static ButtonStyle dynamicStyle(BuildContext context, {ButtonStyle? light, ButtonStyle? dark}) {
    return Theme.of(context).brightness == Brightness.dark ? (dark ?? primary) : (light ?? secondary);
  }
}
