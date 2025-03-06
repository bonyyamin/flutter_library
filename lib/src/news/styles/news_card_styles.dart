import 'package:flutter/material.dart';
import 'news_colors.dart';

class NewsCardStyles {
  // Base card style for light & dark themes
  static BoxDecoration cardDecoration({bool isDarkMode = false}) {
    return BoxDecoration(
      color: isDarkMode ? NewsColors.surfaceDark : NewsColors.surfaceLight,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        if (!isDarkMode) // Add shadows only for light mode
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
      ],
    );
  }

  // Card padding for internal content
  static EdgeInsetsGeometry cardPadding = const EdgeInsets.all(12);

  // Image corner radius for a sleek look
  static BorderRadius imageBorderRadius = BorderRadius.circular(12);

  // Card elevation for Material-based cards
  static double cardElevation({bool isDarkMode = false}) => isDarkMode ? 0 : 4;

  // Card text styles (optional)
  static TextStyle cardTitleStyle({bool isDarkMode = false}) => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: isDarkMode ? Colors.white : Colors.black87,
      );

  static TextStyle cardSubtitleStyle({bool isDarkMode = false}) => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: isDarkMode ? Colors.white70 : Colors.black54,
      );
}


/*
Container(
  decoration: NewsCardStyles.cardDecoration(isDarkMode: false),
  padding: NewsCardStyles.cardPadding,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: NewsCardStyles.imageBorderRadius,
        child: Image.network('https://via.placeholder.com/400'),
      ),
      const SizedBox(height: 8),
      Text(
        'Breaking News Title',
        style: NewsCardStyles.cardTitleStyle(isDarkMode: false),
      ),
      const SizedBox(height: 4),
      Text(
        'Short news description goes here.',
        style: NewsCardStyles.cardSubtitleStyle(isDarkMode: false),
      ),
    ],
  ),
)
*/