import 'package:flutter/material.dart';
import '../styles/news_colors.dart';

class NewsBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const NewsBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: isDarkMode ? NewsColors.backgroundDark : Colors.white,
      selectedItemColor: NewsColors.primary,
      unselectedItemColor: isDarkMode ? Colors.white60 : Colors.black54,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.trending_up),
          label: "Trending",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: "Bookmarks",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}



//how to use inside a Scaffold
/*
Scaffold(
  body: _pages[_selectedIndex], // A list of pages
  bottomNavigationBar: NewsBottomNavigationBar(
    currentIndex: _selectedIndex,
    onTap: (index) {
      setState(() {
        _selectedIndex = index;
      });
    },
  ),
);
*/