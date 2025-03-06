import 'package:flutter/material.dart';
import 'news_colors.dart';

class NewsButtonStyles {
  // Common button padding
  static const EdgeInsetsGeometry buttonPadding = EdgeInsets.symmetric(
    vertical: 12,
    horizontal: 20,
  );

  // Border radius for rounded buttons
  static BorderRadius buttonBorderRadius = BorderRadius.circular(8);

  // Elevated button style
  static ButtonStyle elevatedButton({bool isDarkMode = false}) {
    return ElevatedButton.styleFrom(
      backgroundColor: NewsColors.primary,
      foregroundColor: Colors.white,
      padding: buttonPadding,
      shape: RoundedRectangleBorder(borderRadius: buttonBorderRadius),
      elevation: isDarkMode ? 0 : 4,
    );
  }

  // Outlined button style
  static ButtonStyle outlinedButton({bool isDarkMode = false}) {
    return OutlinedButton.styleFrom(
      foregroundColor: NewsColors.primary,
      padding: buttonPadding,
      shape: RoundedRectangleBorder(borderRadius: buttonBorderRadius),
      side: BorderSide(color: NewsColors.primary, width: 1.5),
    );
  }

  // Text button style
  static ButtonStyle textButton({bool isDarkMode = false}) {
    return TextButton.styleFrom(
      foregroundColor: NewsColors.primary,
      padding: buttonPadding,
    );
  }
}


//Elevated Button (Primary Action)
/*
ElevatedButton(
  style: NewsButtonStyles.elevatedButton(isDarkMode: false),
  onPressed: () {},
  child: Text('Read More'),
)
*/

//Outlined Button (Secondary Action)
/*
OutlinedButton(
  style: NewsButtonStyles.outlinedButton(isDarkMode: false),
  onPressed: () {},
  child: Text('Bookmark'),
)
*/

//Text Button (Minimal UI)
/*
TextButton(
  style: NewsButtonStyles.textButton(isDarkMode: false),
  onPressed: () {},
  child: Text('Share'),
)
*/
