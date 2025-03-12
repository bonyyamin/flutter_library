import 'package:flutter/material.dart';
import '../styles/news_text_styles.dart';

class LoadingIndicator extends StatelessWidget {
  final String? message;

  const LoadingIndicator({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          if (message != null) ...[
            const SizedBox(height: 12),
            Text(
              message!,
              style: NewsTextStyles.bodyText1(isDarkMode: isDarkMode),
            ),
          ],
        ],
      ),
    );
  }
}



//how to use

//basic loader LoadingIndicator();
//with custom message LoadingIndicator(message: 'Loading latest news...');