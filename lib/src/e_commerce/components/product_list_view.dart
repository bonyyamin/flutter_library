import 'package:flutter/material.dart';
import 'product_card.dart';

/// A widget for displaying a list of products (e.g., search results, category listings).
class ProductListView extends StatelessWidget {
  final List<Product> products;

  const ProductListView({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? _buildEmptyState()
        : ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
          );
  }

  /// Builds an empty state when no products are available.
  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 80, color: Colors.grey),
          SizedBox(height: 10),
          Text("No products found", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text("Try searching for something else", style: TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      ),
    );
  }
}



//how to use
/*
ProductListView(
  products: [
    Product(
      imageUrl: "https://via.placeholder.com/150",
      name: "Smartphone",
      price: 699.99,
      oldPrice: 799.99,
      rating: 4.7,
      onAddToCart: () => print("Added Smartphone to cart"),
      onTap: () => print("Navigating to Smartphone details"),
    ),
    Product(
      imageUrl: "https://via.placeholder.com/150",
      name: "Laptop",
      price: 999.99,
      rating: 4.8,
      onAddToCart: () => print("Added Laptop to cart"),
      onTap: () => print("Navigating to Laptop details"),
    ),
  ],
)
*/


/*
Key Features of This Widget:
✅ Displays a List of ProductCard Items
✅ Handles Empty State Gracefully – Shows a "No Products Found" message.
✅ Reusable for Search Results & Category Listings
*/