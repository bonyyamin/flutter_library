import 'package:flutter/material.dart';
import '../styles/news_text_styles.dart';
import '../styles/news_colors.dart';

class CategoryNavigationBar extends StatefulWidget {
  final List<String> categories;
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const CategoryNavigationBar({
    Key? key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  State<CategoryNavigationBar> createState() => _CategoryNavigationBarState();
}

class _CategoryNavigationBarState extends State<CategoryNavigationBar> {
  late String _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.selectedCategory;
  }

  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;
    });
    widget.onCategorySelected(category);
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          final category = widget.categories[index];
          final bool isSelected = category == _selectedCategory;

          return GestureDetector(
            onTap: () => _selectCategory(category),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: isSelected
                    ? (isDarkMode ? NewsColors.primary.withOpacity(0.8) : NewsColors.primary)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? Colors.transparent : (isDarkMode ? Colors.white54 : Colors.black26),
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  category,
                  style: NewsTextStyles.bodyText1(isDarkMode: isDarkMode).copyWith(
                    color: isSelected ? Colors.white : (isDarkMode ? Colors.white70 : Colors.black87),
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}



//how to use
/*
CategoryNavigationBar(
  categories: ["All", "Technology", "Sports", "Business", "Entertainment"],
  selectedCategory: "All",
  onCategorySelected: (category) {
    print("Selected Category: $category");
    // Fetch articles for the selected category
  },
);
*/