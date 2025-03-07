import 'package:flutter/material.dart';
import '../styles/ecommerce_colors.dart';

/// A reusable search bar for product searches.
class SearchBarWidget extends StatefulWidget {
  final Function(String) onSearch;
  final String hintText;

  const SearchBarWidget({
    Key? key,
    required this.onSearch,
    this.hintText = "Search products...",
  }) : super(key: key);

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _searchController = TextEditingController();

  void _clearSearch() {
    _searchController.clear();
    widget.onSearch('');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: EcommerceColors.border),
      ),
      child: TextField(
        controller: _searchController,
        onChanged: widget.onSearch,
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: const Icon(Icons.search, color: EcommerceColors.textHint),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear, color: EcommerceColors.textHint),
                  onPressed: _clearSearch,
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        ),
      ),
    );
  }
}


//how to use
/*
SearchBarWidget(
  onSearch: (query) {
    print("Searching for: $query");
  },
)
*/


/*
Key Features of This Widget:
✅ Search Input Field – Users can enter queries dynamically.
✅ Clear Button (X) – Allows resetting the search field.
✅ Live Search Support – Calls onSearch function whenever input changes.
*/