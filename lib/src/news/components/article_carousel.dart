import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../styles/news_card_styles.dart';
import '../styles/news_text_styles.dart';
import '../utils/formatters.dart';

class ArticleCarousel extends StatelessWidget {
  final List<Article> articles;
  final Function(Article) onArticleTap;

  const ArticleCarousel({
    Key? key,
    required this.articles,
    required this.onArticleTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 250,
        viewportFraction: 0.85,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        enableInfiniteScroll: true,
      ),
      itemCount: articles.length,
      itemBuilder: (context, index, realIndex) {
        final article = articles[index];
        return GestureDetector(
          onTap: () => onArticleTap(article),
          child: Container(
            decoration: NewsCardStyles.cardDecoration(isDarkMode: isDarkMode),
            child: Stack(
              children: [
                // Background Image
                ClipRRect(
                  borderRadius: NewsCardStyles.imageBorderRadius,
                  child: Image.network(
                    article.imageUrl,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey.shade300,
                      child: const Center(child: Icon(Icons.broken_image, size: 50, color: Colors.grey)),
                    ),
                  ),
                ),

                // Gradient Overlay
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: NewsCardStyles.imageBorderRadius,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ),

                // Article Info (Title, Source, Time)
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Article Title
                      Text(
                        Formatters.truncate(article.title, maxLength: 60),
                        style: NewsTextStyles.headline2(isDarkMode: true),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),

                      // Source & Time Ago
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            article.source,
                            style: NewsTextStyles.caption(isDarkMode: true),
                          ),
                          Text(
                            Formatters.timeAgo(article.publishedAt),
                            style: NewsTextStyles.caption(isDarkMode: true),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Article model
class Article {
  final String title;
  final String imageUrl;
  final String source;
  final DateTime publishedAt;

  Article({
    required this.title,
    required this.imageUrl,
    required this.source,
    required this.publishedAt,
  });
}


//how to use
/*
ArticleCarousel(
  articles: [
    Article(
      title: "Flutter 3.0 Released with Exciting Features!",
      imageUrl: "https://example.com/news1.jpg",
      source: "TechCrunch",
      publishedAt: DateTime.now().subtract(Duration(hours: 3)),
    ),
    Article(
      title: "New AI Model Breaks Records in Speed and Accuracy",
      imageUrl: "https://example.com/news2.jpg",
      source: "The Verge",
      publishedAt: DateTime.now().subtract(Duration(hours: 6)),
    ),
  ],
  onArticleTap: (article) {
    // Navigate to the article detail page
  },
);
*/