import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import '../styles/news_text_styles.dart';
import '../styles/news_colors.dart';

class BreakingNewsBanner extends StatelessWidget {
  final String headline;
  final VoidCallback onTap;

  const BreakingNewsBanner({
    Key? key,
    required this.headline,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        color: isDarkMode ? NewsColors.secondary : NewsColors.primary, // Dynamic color
        child: Row(
          children: [
            const Icon(Icons.flash_on, color: Colors.white), // Breaking news icon
            const SizedBox(width: 8),
            Expanded(
              child: SizedBox(
                height: 20,
                child: Marquee(
                  text: headline,
                  style: NewsTextStyles.bodyText1(isDarkMode: true).copyWith(color: Colors.white),
                  scrollAxis: Axis.horizontal,
                  blankSpace: 30.0,
                  velocity: 30.0,
                  pauseAfterRound: const Duration(seconds: 2),
                  startPadding: 10.0,
                  accelerationDuration: const Duration(seconds: 1),
                  decelerationDuration: const Duration(milliseconds: 500),
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    );
  }
}


//how to use
/*
BreakingNewsBanner(
  headline: "Breaking: Flutter 3.0 Released with Exciting New Features!",
  onTap: () {
    // Navigate to full breaking news article
  },
);
*/