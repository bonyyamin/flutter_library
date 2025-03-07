import 'package:flutter/material.dart';
import '../styles/ecommerce_colors.dart';

/// A widget for selecting product quantity, size, variant, or color.
class QuantityAndSizeSelector extends StatefulWidget {
  final int initialQuantity;
  final List<String> sizes;
  final List<String> colors;
  final Function(int quantity, String? selectedSize, String? selectedColor) onSelectionChanged;

  const QuantityAndSizeSelector({
    Key? key,
    this.initialQuantity = 1,
    required this.sizes,
    required this.colors,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  _QuantityAndSizeSelectorState createState() => _QuantityAndSizeSelectorState();
}

class _QuantityAndSizeSelectorState extends State<QuantityAndSizeSelector> {
  late int _quantity;
  String? _selectedSize;
  String? _selectedColor;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
    _selectedSize = widget.sizes.isNotEmpty ? widget.sizes.first : null;
    _selectedColor = widget.colors.isNotEmpty ? widget.colors.first : null;
  }

  void _updateSelection() {
    widget.onSelectionChanged(_quantity, _selectedSize, _selectedColor);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Quantity Selector
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Quantity", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove, color: EcommerceColors.primary),
                  onPressed: _quantity > 1
                      ? () {
                          setState(() => _quantity--);
                          _updateSelection();
                        }
                      : null,
                ),
                Text(_quantity.toString(), style: const TextStyle(fontSize: 16)),
                IconButton(
                  icon: const Icon(Icons.add, color: EcommerceColors.primary),
                  onPressed: () {
                    setState(() => _quantity++);
                    _updateSelection();
                  },
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Size Selector
        if (widget.sizes.isNotEmpty) ...[
          const Text("Select Size", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Wrap(
            spacing: 10,
            children: widget.sizes.map((size) {
              return ChoiceChip(
                label: Text(size),
                selected: _selectedSize == size,
                onSelected: (selected) {
                  setState(() => _selectedSize = size);
                  _updateSelection();
                },
                selectedColor: EcommerceColors.primary,
                backgroundColor: EcommerceColors.border,
                labelStyle: TextStyle(color: _selectedSize == size ? Colors.white : EcommerceColors.textPrimary),
              );
            }).toList(),
          ),
          const SizedBox(height: 10),
        ],

        // Color Selector
        if (widget.colors.isNotEmpty) ...[
          const Text("Select Color", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Wrap(
            spacing: 8,
            children: widget.colors.map((color) {
              return GestureDetector(
                onTap: () {
                  setState(() => _selectedColor = color);
                  _updateSelection();
                },
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(int.parse(color)),
                    border: _selectedColor == color
                        ? Border.all(color: EcommerceColors.primary, width: 3)
                        : Border.all(color: Colors.transparent),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ],
    );
  }
}


//how to use
/*
QuantityAndSizeSelector(
  initialQuantity: 1,
  sizes: ["S", "M", "L", "XL"],
  colors: ["0xFF000000", "0xFFFF0000", "0xFF0000FF"], // Black, Red, Blue
  onSelectionChanged: (quantity, selectedSize, selectedColor) {
    print("Quantity: $quantity");
    print("Selected Size: $selectedSize");
    print("Selected Color: $selectedColor");
  },
)
*/