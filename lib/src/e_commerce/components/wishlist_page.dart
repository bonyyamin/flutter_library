import 'package:flutter/material.dart';
import '../components/product_card.dart';
import '../styles/ecommerce_colors.dart';

/// Model for a wishlist item (inherits from Product model)
class WishlistItem extends Product {
  final VoidCallback onRemove;
  final VoidCallback onMoveToCart;

  WishlistItem({
    required String imageUrl,
    required String name,
    required double price,
    double? oldPrice,
    required double rating,
    required VoidCallback onTap,
    required this.onRemove,
    required this.onMoveToCart,
  }) : super(
         imageUrl: imageUrl,
         name: name,
         price: price,
         oldPrice: oldPrice,
         rating: rating,
         onTap: onTap,
         onAddToCart: onMoveToCart,
       );
}

/// A page to display the user's wishlist.
class WishlistPage extends StatelessWidget {
  final List<WishlistItem> wishlistItems;

  const WishlistPage({Key? key, required this.wishlistItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Wishlist"),
        backgroundColor: EcommerceColors.primary,
      ),
      body:
          wishlistItems.isEmpty
              ? _buildEmptyState()
              : ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: wishlistItems.length,
                itemBuilder: (context, index) {
                  final item = wishlistItems[index];
                  return _buildWishlistItem(item);
                },
              ),
    );
  }

  /// Builds an individual wishlist item card.
  Widget _buildWishlistItem(WishlistItem item) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductCard(product: item), // Displays product details

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remove from Wishlist Button
                TextButton.icon(
                  onPressed: item.onRemove,
                  icon: const Icon(Icons.delete, color: EcommerceColors.error),
                  label: const Text(
                    "Remove",
                    style: TextStyle(color: EcommerceColors.error),
                  ),
                ),

                // Move to Cart Button
                ElevatedButton.icon(
                  onPressed: item.onMoveToCart,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: EcommerceColors.primary,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                  ),
                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                  label: const Text(
                    "Move to Cart",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the empty state when there are no wishlist items.
  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 80,
            color: EcommerceColors.textHint,
          ),
          SizedBox(height: 10),
          Text(
            "Your wishlist is empty",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            "Browse products and add them to your wishlist!",
            style: TextStyle(
              fontSize: 16,
              color: EcommerceColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}



//
/*
WishlistPage(
  wishlistItems: [
    WishlistItem(
      imageUrl: "https://via.placeholder.com/150",
      name: "Smartwatch",
      price: 199.99,
      oldPrice: 249.99,
      rating: 4.5,
      onTap: () => print("Viewing Smartwatch"),
      onRemove: () => print("Removed Smartwatch from Wishlist"),
      onMoveToCart: () => print("Moved Smartwatch to Cart"),
    ),
  ],
)
*/



/*
Key Features of This Page:
✅ Displays Wishlist Items as Product Cards – Shows image, price, rating, and name.
✅ Allows Removing Items from Wishlist – Users can remove an item.
✅ Supports "Move to Cart" Feature – Adds items to the cart directly.
✅ Handles Empty Wishlist Gracefully – Shows empty state UI when there are no items.
*/