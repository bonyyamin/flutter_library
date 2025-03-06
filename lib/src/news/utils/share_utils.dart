import 'package:share_plus/share_plus.dart';

class ShareUtils {
  // Share article link with optional title and description
  static Future<void> shareArticle({
    required String url,
    String? title,
    String? description,
  }) async {
    String content = title != null ? '$title\n\n$url' : url;
    if (description != null) {
      content = '$title\n\n$description\n\n$url';
    }

    await Share.share(content);
  }

  // Share plain text (e.g., breaking news, quotes, headlines)
  static Future<void> shareText(String text) async {
    await Share.share(text);
  }
}


//how to use

//Share an article
/*
ShareUtils.shareArticle(
  url: 'https://newswebsite.com/article/123',
  title: 'Breaking News: Flutter 3.0 Released!',
  description: 'Flutter 3.0 brings exciting new features for cross-platform development.',
);
*/


//Share Text (Breaking News, Quotes, etc.)
/*
ShareUtils.shareText('Breaking News: Major event happening now!');
*/
