import 'package:flutter/material.dart';
import 'package:flutter_library/src/e_commerce/example_widget/product_carousel_ex.dart' show ProductCard;

/// Model for product data
class Product {
  final String imageUrl;
  final String name;
  final double price;
  final double? oldPrice;
  final VoidCallback onTap;

  Product({
    required this.imageUrl,
    required this.name,
    required this.price,
    this.oldPrice,
    required this.onTap,
  });
}

/// A horizontal scrolling product carousel.
class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  final String title;
  final EdgeInsets padding;
  final double height;

  const ProductCarousel({
    Key? key,
    required this.products,
    this.title = 'Featured Products',
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    this.height = 250,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding,
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: height,
          child: ListView.separated(
            padding: padding,
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(
                imageUrl: product.imageUrl,
                name: product.name,
                price: product.price,
                oldPrice: product.oldPrice,
                onTap: product.onTap,
              );
            },
          ),
        ),
      ],
    );
  }
}



//how to use
/*
ProductCarousel(
  title: "Best Sellers",
  products: [
    Product(
      imageUrl: "https://via.placeholder.com/150",
      name: "Cool Sneakers",
      price: 79.99,
      oldPrice: 99.99,
      onTap: () => print("Clicked Cool Sneakers"),
    ),
    Product(
      imageUrl: "https://via.placeholder.com/150",
      name: "Leather Wallet",
      price: 49.99,
      onTap: () => print("Clicked Leather Wallet"),
    ),
  ],
)
*/


/*
Key Features of This Widget:
✅ Displays Products Horizontally – Great for featured sections.
✅ Customizable Height & Padding – Allows design flexibility.
✅ Supports Old Prices – If a discount exists, it displays an old price with a strikethrough.
*/