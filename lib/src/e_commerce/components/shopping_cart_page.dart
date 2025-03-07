import 'package:flutter/material.dart';
import '../components/order_summary.dart';
import '../styles/ecommerce_colors.dart';

/// Model for a shopping cart item
class CartItem {
  final String imageUrl;
  final String name;
  final double price;
  final int quantity;
  final VoidCallback onRemove;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  CartItem({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.quantity,
    required this.onRemove,
    required this.onIncrease,
    required this.onDecrease,
  });
}

/// Full page to display shopping cart details.
class ShoppingCartPage extends StatelessWidget {
  final List<CartItem> cartItems;
  final VoidCallback onCheckout;

  const ShoppingCartPage({
    Key? key,
    required this.cartItems,
    required this.onCheckout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double subtotal = cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
    double discount = subtotal > 100 ? 10 : 0; // Example discount logic
    double shippingFee = subtotal > 50 ? 0 : 5.99; // Free shipping over $50
    double tax = subtotal * 0.08; // 8% tax

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart"),
        backgroundColor: EcommerceColors.primary,
      ),
      body: cartItems.isEmpty
          ? _buildEmptyCart()
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return _buildCartItem(item);
                    },
                  ),
                ),
                OrderSummary(
                  orderData: OrderSummaryData(
                    subtotal: subtotal,
                    discount: discount,
                    shippingFee: shippingFee,
                    tax: tax,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onCheckout,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: EcommerceColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text("Proceed to Checkout", style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  /// Builds an individual cart item widget.
  Widget _buildCartItem(CartItem item) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(item.imageUrl, width: 80, height: 80, fit: BoxFit.cover),
            ),
            const SizedBox(width: 12),

            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text("\$${item.price.toStringAsFixed(2)}", style: const TextStyle(fontSize: 16, color: EcommerceColors.primary)),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      IconButton(icon: const Icon(Icons.remove), onPressed: item.onDecrease),
                      Text(item.quantity.toString(), style: const TextStyle(fontSize: 16)),
                      IconButton(icon: const Icon(Icons.add), onPressed: item.onIncrease),
                    ],
                  ),
                ],
              ),
            ),

            // Remove Button
            IconButton(
              icon: const Icon(Icons.delete, color: EcommerceColors.error),
              onPressed: item.onRemove,
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the empty cart view.
  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.shopping_cart, size: 80, color: EcommerceColors.textHint),
          const SizedBox(height: 16),
          const Text("Your cart is empty!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("Start shopping to add items to your cart.", style: TextStyle(fontSize: 16, color: EcommerceColors.textSecondary)),
        ],
      ),
    );
  }
}


//how to use
/*
ShoppingCartPage(
  cartItems: [
    CartItem(
      imageUrl: "https://via.placeholder.com/150",
      name: "Running Shoes",
      price: 49.99,
      quantity: 1,
      onRemove: () => print("Removed Running Shoes"),
      onIncrease: () => print("Increased Running Shoes Quantity"),
      onDecrease: () => print("Decreased Running Shoes Quantity"),
    ),
  ],
  onCheckout: () => print("Proceeding to checkout..."),
)
*/


/*
Key Features of This Page:
✅ Displays Cart Items with Image, Name, Price & Quantity
✅ Allows Quantity Increase/Decrease & Item Removal
✅ Calculates Order Summary with Discounts, Shipping, and Tax
✅ "Proceed to Checkout" Button for Next Step
✅ Handles Empty Cart Scenario Gracefully
*/