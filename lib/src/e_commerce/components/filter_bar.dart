import 'package:flutter/material.dart';
import '../styles/ecommerce_colors.dart';

/// Callback function when a filter option is selected.
typedef FilterCallback = void Function({String? category, double? minPrice, double? maxPrice, double? rating});

/// A filter bar widget for filtering products.
class FilterBar extends StatefulWidget {
  final List<String> categories;
  final FilterCallback onFilterApplied;

  const FilterBar({
    Key? key,
    required this.categories,
    required this.onFilterApplied,
  }) : super(key: key);

  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  String? _selectedCategory;
  double _minPrice = 0;
  double _maxPrice = 500;
  double _selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Filter
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: "Category"),
              value: _selectedCategory,
              items: widget.categories
                  .map((category) => DropdownMenuItem(value: category, child: Text(category)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
            ),
            const SizedBox(height: 10),

            // Price Range Filter
            const Text("Price Range", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            RangeSlider(
              values: RangeValues(_minPrice, _maxPrice),
              min: 0,
              max: 1000,
              divisions: 10,
              labels: RangeLabels("\$${_minPrice.toInt()}", "\$${_maxPrice.toInt()}"),
              onChanged: (values) {
                setState(() {
                  _minPrice = values.start;
                  _maxPrice = values.end;
                });
              },
              activeColor: EcommerceColors.primary,
            ),

            // Rating Filter
            const SizedBox(height: 10),
            const Text("Minimum Rating", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Slider(
              value: _selectedRating,
              min: 0,
              max: 5,
              divisions: 5,
              label: _selectedRating.toString(),
              onChanged: (value) {
                setState(() {
                  _selectedRating = value;
                });
              },
              activeColor: EcommerceColors.accent,
            ),

            const SizedBox(height: 10),

            // Apply Filter Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  widget.onFilterApplied(
                    category: _selectedCategory,
                    minPrice: _minPrice,
                    maxPrice: _maxPrice,
                    rating: _selectedRating > 0 ? _selectedRating : null,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: EcommerceColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text("Apply Filters", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//how to use
/*
FilterBar(
  categories: ["All", "Electronics", "Clothing", "Shoes", "Accessories"],
  onFilterApplied: ({String? category, double? minPrice, double? maxPrice, double? rating}) {
    print("Selected Category: $category");
    print("Price Range: \$${minPrice?.toInt()} - \$${maxPrice?.toInt()}");
    print("Minimum Rating: $rating");
  },
)
*/