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



/*
            // Default Card Style
            Container(
              decoration: EcommerceCardStyles.base,
              padding: EdgeInsets.all(16.0),
              child: Text('Default Card Style'),
            ),

            // Elevated Card Style
            Container(
              decoration: EcommerceCardStyles.elevated,
              padding: EdgeInsets.all(16.0),
              child: Text('Elevated Card Style'),
            ),

            // Bordered Card Style
            Container(
              decoration: EcommerceCardStyles.bordered,
              padding: EdgeInsets.all(16.0),
              child: Text('Bordered Card Style'),
            ),
            
            // Dynamic Card Style (Adapts to Light & Dark mode)
            Container(
              decoration: EcommerceCardStyles.dynamicStyle(context),
              padding: EdgeInsets.all(16.0),
              child: Text('Dynamic Card Style'),
            ),
*/



/*
Key Features of This Code:
✅ Modern & Clean Design – Buttons and cards follow contemporary UI trends.
✅ Dynamic Styling Support – Can switch between light and dark themes.
✅ Flexible Button & Card Variations – Includes primary, secondary, outline, disabled buttons, and different card styles.
*/