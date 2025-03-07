import 'package:flutter/material.dart';
import '../styles/ecommerce_colors.dart';

/// A reusable widget for displaying star ratings.
class RatingStars extends StatelessWidget {
  final double rating; // Rating value (e.g., 4.5)
  final int maxStars; // Maximum number of stars (default: 5)
  final double size; // Size of the stars
  final Color color; // Color of filled stars
  final Color backgroundColor; // Color of unfilled stars
  final bool showRatingValue; // Option to show numeric rating

  const RatingStars({
    Key? key,
    required this.rating,
    this.maxStars = 5,
    this.size = 20,
    this.color = EcommerceColors.accent,
    this.backgroundColor = EcommerceColors.border,
    this.showRatingValue = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];

    for (int i = 1; i <= maxStars; i++) {
      if (i <= rating) {
        // Full Star
        stars.add(Icon(Icons.star, color: color, size: size));
      } else if (i - 0.5 <= rating) {
        // Half Star
        stars.add(Icon(Icons.star_half, color: color, size: size));
      } else {
        // Empty Star
        stars.add(Icon(Icons.star_border, color: backgroundColor, size: size));
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(children: stars), // Display stars
        if (showRatingValue) ...[
          const SizedBox(width: 6),
          Text(
            rating.toStringAsFixed(1), // Display numeric rating
            style: TextStyle(fontSize: size * 0.8, fontWeight: FontWeight.bold, color: EcommerceColors.textPrimary),
          ),
        ],
      ],
    );
  }
}



/*
RatingStars(
  rating: 4.5,
  size: 24,
  color: Colors.amber,
)
*/


/*
Key Features of This Widget:
✅ Supports Full & Half Stars – Handles decimal ratings like 4.5.
✅ Customizable Appearance – Allows setting size, color, and max stars.
✅ Optional Numeric Rating – Displays 4.5 next to stars if showRatingValue = true.
*/