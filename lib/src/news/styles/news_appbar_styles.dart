import 'package:flutter/material.dart';
import 'news_colors.dart';
import 'news_text_styles.dart';

class NewsAppBarStyles {
  // Default AppBar style
  static AppBarTheme appBarTheme({bool isDarkMode = false}) {
    return AppBarTheme(
      backgroundColor: isDarkMode ? NewsColors.backgroundDark : NewsColors.primary,
      foregroundColor: Colors.white,
      elevation: isDarkMode ? 0 : 4,
      titleTextStyle: NewsTextStyles.headline2(isDarkMode: isDarkMode).copyWith(
        color: Colors.white,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }

  // AppBar with centered title (default news header)
  static PreferredSizeWidget defaultAppBar({
    required String title,
    bool isDarkMode = false,
    List<Widget>? actions,
  }) {
    return AppBar(
      title: Text(title, style: NewsTextStyles.headline2(isDarkMode: isDarkMode)),
      centerTitle: true,
      backgroundColor: isDarkMode ? NewsColors.backgroundDark : NewsColors.primary,
      elevation: isDarkMode ? 0 : 4,
      actions: actions,
    );
  }

  // Transparent AppBar for immersive UI (used in article detail pages)
  static PreferredSizeWidget transparentAppBar({bool isDarkMode = false}) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: isDarkMode ? Colors.white : Colors.black),
    );
  }
}


//Default News AppBar
/*
Scaffold(
  appBar: NewsAppBarStyles.defaultAppBar(title: 'Latest News', isDarkMode: false),
  body: Center(child: Text('News Content')),
);
*/


//Transparent AppBar (For Fullscreen Images/Videos)
/*
Scaffold(
  appBar: NewsAppBarStyles.transparentAppBar(isDarkMode: false),
  extendBodyBehindAppBar: true,
  body: Center(child: Text('News Article')),
);
*/

