import 'package:flutter/material.dart';
import '../components/rating_stars.dart';
import '../components/price_display.dart';
import '../components/add_to_cart_button.dart';
import '../styles/ecommerce_colors.dart';

/// Model for a product
class Product {
  final String imageUrl;
  final String name;
  final double price;
  final double? oldPrice;
  final String description;
  final double rating;

  Product({
    required this.imageUrl,
    required this.name,
    required this.price,
    this.oldPrice,
    required this.description,
    required this.rating,
  });
}

/// A full-page product details screen.
class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: EcommerceColors.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            AspectRatio(
              aspectRatio: 1.2,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    product.name,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  // Rating Stars
                  RatingStars(rating: product.rating, size: 20),

                  const SizedBox(height: 12),

                  // Price Display
                  PriceDisplay(price: product.price, oldPrice: product.oldPrice),

                  const SizedBox(height: 16),

                  // Product Description
                  const Text(
                    "Product Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16, color: EcommerceColors.textSecondary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Floating Add to Cart Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AddToCartButton(
          onPressed: () => print("Added to cart: ${product.name}"),
        ),
      ),
    );
  }
}




//how to use
/*
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ProductDetailPage(
      product: Product(
        imageUrl: "https://via.placeholder.com/600x400",
        name: "Luxury Sneakers",
        price: 99.99,
        oldPrice: 129.99,
        description: "These sneakers are designed for ultimate comfort and style.",
        rating: 4.7,
      ),
    ),
  ),
);
*/


/*
Key Features of This Page:
✅ Displays Product Image, Name, Price, and Description
✅ Includes RatingStars & PriceDisplay Widgets
✅ Floating "Add to Cart" Button for Quick Action
*/