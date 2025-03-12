import 'package:flutter/material.dart';

class Product {
  final String imageUrl;
  final String name;
  final double price;
  final double? oldPrice;
  final String? description;
  final double? rating;
  final VoidCallback? onTap;

  Product({
    required this.imageUrl,
    required this.name,
    required this.price,
    this.oldPrice,
    this.description,
    this.rating,
    this.onTap,
  });
}
