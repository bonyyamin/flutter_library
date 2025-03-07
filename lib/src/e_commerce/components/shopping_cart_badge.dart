import 'package:flutter/material.dart';
import '../styles/ecommerce_colors.dart';

/// A reusable shopping cart icon with a badge to show the number of items in the cart.
class ShoppingCartBadge extends StatelessWidget {
  final int itemCount;
  final VoidCallback onTap;
  final Color iconColor;
  final Color badgeColor;

  const ShoppingCartBadge({
    Key? key,
    required this.itemCount,
    required this.onTap,
    this.iconColor = Colors.black,
    this.badgeColor = EcommerceColors.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: Icon(Icons.shopping_cart, color: iconColor, size: 28),
          onPressed: onTap,
        ),

        // Badge (only show if itemCount > 0)
        if (itemCount > 0)
          Positioned(
            right: 5,
            top: 5,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: badgeColor,
                shape: BoxShape.circle,
              ),
              child: Text(
                itemCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}



//how to use
/*
ShoppingCartBadge(
  itemCount: 3,
  onTap: () {
    print("Navigating to shopping cart...");
  },
)
*/

/*
Key Features of This Widget:
✅ Displays Shopping Cart Icon – Users can tap to navigate to the cart page.
✅ Badge Shows Item Count – Updates dynamically based on cart contents.
✅ Hides Badge When Cart is Empty (itemCount == 0)
*/