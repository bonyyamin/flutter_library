import 'package:flutter/material.dart';
import '../components/rating_stars.dart';
import '../styles/ecommerce_colors.dart';

/// Model for a product review
class Review {
  final String userName;
  final String userProfileImage;
  final double rating;
  final String reviewText;
  final String timestamp;

  Review({
    required this.userName,
    required this.userProfileImage,
    required this.rating,
    required this.reviewText,
    required this.timestamp,
  });
}

/// A reusable card widget to display an individual product review.
class ReviewCard extends StatelessWidget {
  final Review review;

  const ReviewCard({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info Row
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(review.userProfileImage),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(review.userName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(review.timestamp, style: const TextStyle(fontSize: 14, color: EcommerceColors.textHint)),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Star Rating
            RatingStars(rating: review.rating, size: 18),

            const SizedBox(height: 8),

            // Review Text
            Text(
              review.reviewText,
              style: const TextStyle(fontSize: 16, color: EcommerceColors.textPrimary),
            ),
          ],
        ),
      ),
    );
  }
}


//how to use
/*
ReviewCard(
  review: Review(
    userName: "John Doe",
    userProfileImage: "https://via.placeholder.com/100",
    rating: 4.5,
    reviewText: "This product exceeded my expectations! Highly recommend.",
    timestamp: "March 5, 2025",
  ),
)
*/

/*
Key Features of This Widget:
✅ Displays User Profile Image, Name, and Timestamp
✅ Shows Star Rating using RatingStars Widget
✅ Formats Review Text Clearly
*/