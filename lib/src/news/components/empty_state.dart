import 'package:flutter/material.dart';
import '../styles/news_text_styles.dart';

class EmptyState extends StatelessWidget {
  final String message;
  final String? imagePath;
  final String? actionText;
  final VoidCallback? onActionPressed;

  const EmptyState({
    Key? key,
    required this.message,
    this.imagePath,
    this.actionText,
    this.onActionPressed,
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
            // Optional image
            if (imagePath != null)
              Image.asset(
                imagePath!,
                height: 150,
                fit: BoxFit.contain,
              ),
            const SizedBox(height: 16),

            // Message
            Text(
              message,
              style: NewsTextStyles.headline2(isDarkMode: isDarkMode),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),

            // Optional Action Button
            if (actionText != null && onActionPressed != null)
              ElevatedButton(
                onPressed: onActionPressed,
                child: Text(actionText!),
              ),
          ],
        ),
      ),
    );
  }
}



//how to use

//basic usage (No News Found)
/*
EmptyState(
  message: "No news available at the moment.",
  imagePath: "assets/images/empty.png", // Optional image
);
*/

//with action button (Try Again/Refresh/Retry Search)
/*
EmptyState(
  message: "No results found for your search.",
  imagePath: "assets/images/no_results.png",
  actionText: "Try Again",
  onActionPressed: () {
    // Trigger a search refresh or action
  },
);
*/