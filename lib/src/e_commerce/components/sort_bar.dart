import 'package:flutter/material.dart';
import '../styles/ecommerce_colors.dart';

/// Callback function when a sorting option is selected.
typedef SortCallback = void Function(String sortBy);

/// A sort bar widget for sorting products.
class SortBar extends StatefulWidget {
  final SortCallback onSortSelected;

  const SortBar({Key? key, required this.onSortSelected}) : super(key: key);

  @override
  _SortBarState createState() => _SortBarState();
}

class _SortBarState extends State<SortBar> {
  String _selectedSort = "Popularity";

  final List<String> _sortOptions = [
    "Popularity",
    "Price: Low to High",
    "Price: High to Low",
    "Rating: High to Low",
    "Newest First"
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Sort by:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: _selectedSort,
              underline: Container(),
              items: _sortOptions.map((sort) {
                return DropdownMenuItem(value: sort, child: Text(sort));
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedSort = value;
                  });
                  widget.onSortSelected(value);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}


//how to use
/*
SortBar(
  onSortSelected: (sortBy) {
    print("Selected Sort: $sortBy");
  },
)
*/


/*
Key Features of This Widget:
✅ Sorting Options for Price, Rating, and Popularity
✅ Dropdown Selection for Easy Sorting
✅ Triggers Callback When a Sorting Option is Selected
*/