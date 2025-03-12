import 'package:flutter/material.dart';
import '../styles/news_card_styles.dart';
import '../styles/news_text_styles.dart';

class AuthorCard extends StatelessWidget {
  final String name;
  final String profileImageUrl;
  final String bio;
  final VoidCallback? onFollow;

  const AuthorCard({
    Key? key,
    required this.name,
    required this.profileImageUrl,
    required this.bio,
    this.onFollow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: NewsCardStyles.cardDecoration(isDarkMode: isDarkMode),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile Image
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.network(
              profileImageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person, size: 30, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Author Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: NewsTextStyles.headline2(isDarkMode: isDarkMode),
                ),
                const SizedBox(height: 4),
                Text(
                  bio,
                  style: NewsTextStyles.bodyText2(isDarkMode: isDarkMode),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Follow Button (Optional)
          if (onFollow != null)
            TextButton(
              onPressed: onFollow,
              child: const Text("Follow"),
            ),
        ],
      ),
    );
  }
}



//how to use
/*
AuthorCard(
  name: "John Doe",
  profileImageUrl: "https://example.com/profile.jpg",
  bio: "Tech journalist & AI enthusiast.",
  onFollow: () {
    // Handle follow action
  },
);
*/