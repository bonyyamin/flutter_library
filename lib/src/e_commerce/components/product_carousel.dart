import 'package:flutter/material.dart';
import '../models/product.dart';

class CarouselProductCard extends StatelessWidget {
  final Product product;

  const CarouselProductCard({Key? key, required this.product})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: product.onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                product.imageUrl,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '\$${product.price}',
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          product.oldPrice != null ? Colors.red : Colors.green,
                    ),
                  ),
                  if (product.oldPrice != null)
                    Text(
                      '\$${product.oldPrice}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
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
              return CarouselProductCard(product: product);
            },
          ),
        ),
      ],
    );
  }
}
