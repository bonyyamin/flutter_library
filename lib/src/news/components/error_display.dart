import 'package:flutter/material.dart';
import '../styles/news_text_styles.dart';

class ErrorDisplay extends StatelessWidget {
  final String message;
  final String? imagePath;
  final String? actionText;
  final VoidCallback? onRetry;

  const ErrorDisplay({
    Key? key,
    required this.message,
    this.imagePath,
    this.actionText,
    this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Optional error image
            if (imagePath != null)
              Image.asset(
                imagePath!,
                height: 150,
                fit: BoxFit.contain,
              ),
            const SizedBox(height: 16),

            // Error Message
            Text(
              message,
              style: NewsTextStyles.headline2(isDarkMode: isDarkMode),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),

            // Optional Retry Button
            if (actionText != null && onRetry != null)
              ElevatedButton(
                onPressed: onRetry,
                child: Text(actionText!),
              ),
          ],
        ),
      ),
    );
  }
}



//how to use

//basic error message
/*
ErrorDisplay(
  message: "Something went wrong. Please try again later.",
  imagePath: "assets/images/error.png", // Optional image
);
*/

//with retry button
/*
ErrorDisplay(
  message: "Failed to load news. Check your internet connection.",
  imagePath: "assets/images/no_connection.png",
  actionText: "Retry",
  onRetry: () {
    // Trigger data reload or retry logic
  },
);
*/