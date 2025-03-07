import 'package:flutter/material.dart';
import '../utils/formatters.dart';
import '../styles/ecommerce_colors.dart';

/// Model for order summary data
class OrderSummaryData {
  final double subtotal;
  final double discount;
  final double shippingFee;
  final double tax;

  OrderSummaryData({
    required this.subtotal,
    required this.discount,
    required this.shippingFee,
    required this.tax,
  });

  double get total => subtotal - discount + shippingFee + tax;
}

/// A reusable widget to display the order summary before checkout.
class OrderSummary extends StatelessWidget {
  final OrderSummaryData orderData;

  const OrderSummary({Key? key, required this.orderData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Order Summary",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(height: 20, thickness: 1),

            // Subtotal
            _buildRow("Subtotal", orderData.subtotal),

            // Discount
            _buildRow("Discount", -orderData.discount, isNegative: true),

            // Shipping Fee
            _buildRow("Shipping Fee", orderData.shippingFee),

            // Tax
            _buildRow("Tax", orderData.tax),

            const Divider(height: 20, thickness: 1),

            // Total Price
            _buildRow("Total", orderData.total, isTotal: true),
          ],
        ),
      ),
    );
  }

  /// Helper method to create a row for order summary details.
  Widget _buildRow(String label, double amount, {bool isTotal = false, bool isNegative = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
          Text(
            Formatters.formatCurrency(amount),
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isNegative ? EcommerceColors.error : EcommerceColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}


//how to use
/*
OrderSummary(
  orderData: OrderSummaryData(
    subtotal: 120.00,
    discount: 20.00,
    shippingFee: 5.99,
    tax: 2.50,
  ),
)
*/