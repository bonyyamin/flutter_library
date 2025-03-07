import 'package:flutter/material.dart';
import '../styles/ecommerce_colors.dart';

/// A page to display after a successful order.
class OrderConfirmationPage extends StatelessWidget {
  final String orderId;
  final double totalAmount;
  final VoidCallback onContinueShopping;

  const OrderConfirmationPage({
    Key? key,
    required this.orderId,
    required this.totalAmount,
    required this.onContinueShopping,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Confirmed"),
        backgroundColor: EcommerceColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 100, color: Colors.green),
            const SizedBox(height: 20),
            const Text(
              "Thank You for Your Purchase!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Your order has been successfully placed.",
              style: TextStyle(fontSize: 16, color: EcommerceColors.textSecondary),
            ),
            const SizedBox(height: 20),
            _buildOrderDetail("Order ID", orderId),
            _buildOrderDetail("Total Amount", "\$${totalAmount.toStringAsFixed(2)}"),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onContinueShopping,
                style: ElevatedButton.styleFrom(
                  backgroundColor: EcommerceColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text("Continue Shopping", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Helper method to display order details.
  Widget _buildOrderDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$label: ", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(value, style: TextStyle(fontSize: 16, color: EcommerceColors.primary)),
        ],
      ),
    );
  }
}


//how to use
/*
OrderConfirmationPage(
  orderId: "ORD123456",
  totalAmount: 149.99,
  onContinueShopping: () {
    print("Navigating back to home/shop");
  },
)
*/


/*
Key Features of This Page:
✅ Displays Order Confirmation Message – Includes a thank you note and order success message.
✅ Shows Order Details – Displays Order ID and Total Amount.
✅ "Continue Shopping" Button – Navigates the user back to the store.
*/