import 'package:flutter/material.dart';
import '../components/article_card.dart';
import '../styles/news_text_styles.dart';

class ArticleListView extends StatelessWidget {
  final List<Article> articles;
  final bool isLoading;
  final String emptyMessage;
  final Function(Article) onArticleTap;

  const ArticleListView({
    Key? key,
    required this.articles,
    required this.onArticleTap,
    this.isLoading = false,
    this.emptyMessage = "No articles found.",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (articles.isEmpty) {
      return Center(
        child: Text(
          emptyMessage,
          style: NewsTextStyles.bodyText1(isDarkMode: isDarkMode),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ArticleCard(
          title: articles[index].title,
          imageUrl: articles[index].imageUrl,
          source: articles[index].source,
          publishedAt: articles[index].publishedAt,
          onTap: () => onArticleTap(articles[index]),
        );
      },
    );
  }
}

// Article model for reference
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
ArticleListView(
  articles: [
    Article(
      title: "Breaking News: Flutter 3.0 Released!",
      imageUrl: "https://example.com/news1.jpg",
      source: "TechCrunch",
      publishedAt: DateTime.now().subtract(Duration(hours: 2)),
    ),
    Article(
      title: "New AI Model Breaks Records in Accuracy",
      imageUrl: "https://example.com/news2.jpg",
      source: "The Verge",
      publishedAt: DateTime.now().subtract(Duration(hours: 5)),
    ),
  ],
  isLoading: false,
  onArticleTap: (article) {
    // Navigate to Article Detail Page
  },
);
*/