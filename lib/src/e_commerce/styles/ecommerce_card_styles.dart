import 'package:flutter/material.dart';
import 'ecommerce_colors.dart';

/// Defines card styles for the eCommerce app.
class EcommerceCardStyles {
  // Default Card Style
  static final BoxDecoration base = BoxDecoration(
    color: EcommerceColors.cardBackground,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 6,
        spreadRadius: 2,
        offset: const Offset(0, 3),
      ),
    ],
  );

  // Elevated Card (Used for important content)
  static final BoxDecoration elevated = BoxDecoration(
    color: EcommerceColors.cardBackground,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 8,
        spreadRadius: 3,
        offset: const Offset(0, 4),
      ),
    ],
  );

  // Bordered Card (For outlined style)
  static final BoxDecoration bordered = BoxDecoration(
    color: EcommerceColors.cardBackground,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: EcommerceColors.border, width: 1.5),
  );

  /// Dynamic Card Style (Adapts to Light & Dark mode)
  static BoxDecoration dynamicStyle(BuildContext context, {BoxDecoration? light, BoxDecoration? dark}) {
    return Theme.of(context).brightness == Brightness.dark ? (dark ?? elevated) : (light ?? base);
  }
}
