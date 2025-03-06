import 'package:flutter/material.dart';
import '../styles/news_card_styles.dart';
import '../styles/news_text_styles.dart';
import '../utils/formatters.dart';
import '../utils/share_utils.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String source;
  final DateTime publishedAt;
  final VoidCallback onTap;
  final VoidCallback? onBookmark;

  const ArticleCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.source,
    required this.publishedAt,
    required this.onTap,
    this.onBookmark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: NewsCardStyles.cardDecoration(isDarkMode: isDarkMode),
        padding: NewsCardStyles.cardPadding,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // News Image
            ClipRRect(
              borderRadius: NewsCardStyles.imageBorderRadius,
              child: Image.network(
                imageUrl,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) => Container(
                      height: 180,
                      color: Colors.grey.shade300,
                      child: const Center(
                        child: Icon(
                          Icons.broken_image,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    ),
              ),
            ),
            const SizedBox(height: 8),

            // News Title
            Text(
              Formatters.truncate(title, maxLength: 80),
              style: NewsCardStyles.cardTitleStyle(isDarkMode: isDarkMode),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),

            // News Source & Time Ago
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  source,
                  style: NewsCardStyles.cardSubtitleStyle(
                    isDarkMode: isDarkMode,
                  ),
                ),
                Text(
                  Formatters.timeAgo(publishedAt),
                  style: NewsCardStyles.cardSubtitleStyle(
                    isDarkMode: isDarkMode,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Action Buttons (Bookmark & Share)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Bookmark Button
                IconButton(
                  icon: Icon(
                    Icons.bookmark_border,
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                  onPressed: onBookmark ?? () {},
                ),

                // Share Button
                IconButton(
                  icon: Icon(
                    Icons.share,
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                  onPressed:
                      () =>
                          ShareUtils.shareArticle(url: imageUrl, title: title),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


//How to use in a ListView
/*
ArticleCard(
  title: "Breaking News: Flutter 3.0 Released!",
  imageUrl: "https://example.com/news-image.jpg",
  source: "TechCrunch",
  publishedAt: DateTime.now().subtract(Duration(hours: 2)),
  onTap: () {
    // Navigate to Article Detail Page
  },
  onBookmark: () {
    // Handle Bookmarking
  },
)
*/