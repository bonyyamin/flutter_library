import 'package:flutter/material.dart';

/// Model for a category item
class CategoryItem {
  final String imageUrl;
  final String title;
  final VoidCallback onTap;

  CategoryItem({required this.imageUrl, required this.title, required this.onTap});
}

/// A grid-based category display widget.
class CategoryGrid extends StatelessWidget {
  final List<CategoryItem> categories;
  final int crossAxisCount;
  final double spacing;
  final double aspectRatio;

  const CategoryGrid({
    Key? key,
    required this.categories,
    this.crossAxisCount = 2,
    this.spacing = 10,
    this.aspectRatio = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10),
      itemCount: categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: aspectRatio,
      ),
      itemBuilder: (context, index) {
        final category = categories[index];
        return GestureDetector(
          onTap: category.onTap,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.network(
                      category.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    category.title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}



//how to use
/*
CategoryGrid(
  categories: [
    CategoryItem(
      imageUrl: "https://via.placeholder.com/150",
      title: "Shoes",
      onTap: () => print("Tapped Shoes"),
    ),
    CategoryItem(
      imageUrl: "https://via.placeholder.com/150",
      title: "Watches",
      onTap: () => print("Tapped Watches"),
    ),
  ],
  crossAxisCount: 3, // 3 items per row
)
*/


/*
Key Features of This Widget:
✅ Displays Categories in a Grid – Great for category browsing.
✅ Customizable Grid Layout – Supports dynamic column count and spacing.
✅ Clickable Items – Each category can navigate to a new page.
*/