import 'package:flutter/material.dart';
import 'package:flutter_library/src/e_commerce/components/product_card.dart'
    as card;
import 'package:flutter_library/src/e_commerce/ecom_flutter_library.dart';

class EcommerceExampleScreen extends StatelessWidget {
  const EcommerceExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<card.Product> sampleProducts = [
      card.Product(
        imageUrl: "https://via.placeholder.com/150",
        name: "Wireless Headphones",
        price: 79.99,
        oldPrice: 99.99,
        rating: 4.5,
        onAddToCart: () => print("Added to Cart: Wireless Headphones"),
        onTap: () => print("Navigating to Wireless Headphones details"),
      ),
      card.Product(
        imageUrl: "https://via.placeholder.com/150",
        name: "Smartwatch",
        price: 199.99,
        oldPrice: 249.99,
        rating: 4.7,
        onAddToCart: () => print("Added to Cart: Smartwatch"),
        onTap: () => print("Navigating to Smartwatch details"),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("E-Commerce Demo"),
        actions: [
          ShoppingCartBadge(
            itemCount: 3,
            onTap: () => print("Navigating to Cart"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),

            // Search Bar
            SearchBarWidget(
              onSearch: (query) {
                print("Searching for: $query");
              },
            ),

            // Product List
            Expanded(child: ProductListView(products: sampleProducts)),

            // Checkout Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CheckoutButton(
                onCheckout: () => print("Proceeding to Checkout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
