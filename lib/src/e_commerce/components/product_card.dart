import 'package:flutter/material.dart';
import '../components/rating_stars.dart';
import '../components/price_display.dart';
import '../styles/ecommerce_colors.dart';

/// Model for a product card
class Product {
  final String imageUrl;
  final String name;
  final double price;
  final double? oldPrice;
  final double rating;
  final VoidCallback onAddToCart;
  final VoidCallback onTap;

  Product({
    required this.imageUrl,
    required this.name,
    required this.price,
    this.oldPrice,
    required this.rating,
    required this.onAddToCart,
    required this.onTap,
  });
}

/// A reusable product card widget.
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: product.onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                product.imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(product.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  
                  const SizedBox(height: 6),

                  // Product Rating
                  RatingStars(rating: product.rating, size: 18),

                  const SizedBox(height: 6),

                  // Product Price
                  PriceDisplay(price: product.price, oldPrice: product.oldPrice),

                  const SizedBox(height: 10),

                  // Add to Cart Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: product.onAddToCart,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: EcommerceColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      child: const Text("Add to Cart", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//how to use
/*
ProductCard(
  product: Product(
    imageUrl: "https://via.placeholder.com/150",
    name: "Wireless Headphones",
    price: 79.99,
    oldPrice: 99.99,
    rating: 4.5,
    onAddToCart: () {
      print("Added to Cart: Wireless Headphones");
    },
    onTap: () {
      print("Navigating to product details...");
    },
  ),
)
*/


/*
Key Features of This Widget:
✅ Displays Product Image, Name, Price, and Rating
✅ Handles Discounted Prices – Shows old price with a strikethrough if available.
✅ Clickable for Product Details – Tapping the card navigates to product details.
✅ "Add to Cart" Button – Allows adding the product to the cart.
*/