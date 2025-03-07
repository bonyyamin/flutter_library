import 'package:flutter/material.dart';
import '../styles/news_text_styles.dart';
import '../styles/news_appbar_styles.dart';
import '../styles/news_card_styles.dart';
import '../utils/formatters.dart';
import '../utils/share_utils.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;

  const ArticleDetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: NewsAppBarStyles.defaultAppBar(
        title: "News Detail",
        isDarkMode: isDarkMode,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => ShareUtils.shareArticle(
              url: article.url,
              title: article.title,
              description: article.content,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Article Image
            ClipRRect(
              borderRadius: NewsCardStyles.imageBorderRadius,
              child: Image.network(
                article.imageUrl,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 250,
                  color: Colors.grey.shade300,
                  child: const Center(
                    child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Title
            Text(
              article.title,
              style: NewsTextStyles.headline1(isDarkMode: isDarkMode),
            ),
            const SizedBox(height: 8),

            // Source and Published Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  article.source,
                  style: NewsTextStyles.caption(isDarkMode: isDarkMode),
                ),
                Text(
                  Formatters.timeAgo(article.publishedAt),
                  style: NewsTextStyles.caption(isDarkMode: isDarkMode),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Article Content
            Text(
              article.content,
              style: NewsTextStyles.bodyText1(isDarkMode: isDarkMode),
            ),
            const SizedBox(height: 16),

            // Bookmark Button
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.bookmark_border),
                onPressed: () {
                  // Handle Bookmarking Logic
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Article model
class Article {
  final String title;
  final String imageUrl;
  final String source;
  final DateTime publishedAt;
  final String content;
  final String url;

  Article({
    required this.title,
    required this.imageUrl,
    required this.source,
    required this.publishedAt,
    required this.content,
    required this.url,
  });
}


//how to use
/*
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ArticleDetailPage(
      article: Article(
        title: "Breaking: Flutter 3.0 Released!",
        imageUrl: "https://example.com/news.jpg",
        source: "TechCrunch",
        publishedAt: DateTime.now().subtract(Duration(hours: 2)),
        content: "Flutter 3.0 has been officially released, bringing new improvements to performance...",
        url: "https://techcrunch.com/flutter-3.0",
      ),
    ),
  ),
);
*/