import 'package:flutter/material.dart';
import '../styles/ecommerce_colors.dart';

/// A reusable button to add/remove a product from the wishlist.
class WishlistButton extends StatefulWidget {
  final bool isWishlisted;
  final VoidCallback onToggle;

  const WishlistButton({
    Key? key,
    required this.isWishlisted,
    required this.onToggle,
  }) : super(key: key);

  @override
  _WishlistButtonState createState() => _WishlistButtonState();
}

class _WishlistButtonState extends State<WishlistButton> {
  late bool _wishlisted;

  @override
  void initState() {
    super.initState();
    _wishlisted = widget.isWishlisted;
  }

  void _toggleWishlist() {
    setState(() {
      _wishlisted = !_wishlisted;
    });
    widget.onToggle();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _wishlisted ? Icons.favorite : Icons.favorite_border,
        color: _wishlisted ? EcommerceColors.secondary : EcommerceColors.textHint,
      ),
      onPressed: _toggleWishlist,
    );
  }
}



//how to use
/*
WishlistButton(
  isWishlisted: false,
  onToggle: () {
    print("Wishlist toggled!");
  },
)
*/


/*
Key Features of This Widget:
✅ Toggles Between Filled (❤️) and Outlined (♡) Icons
✅ Supports Initial State (isWishlisted) – Updates dynamically.
✅ Calls onToggle() When Clicked – Allows handling wishlist logic.
*/