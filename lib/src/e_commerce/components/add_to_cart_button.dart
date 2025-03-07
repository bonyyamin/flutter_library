import 'package:flutter/material.dart';
import '../styles/ecommerce_button_styles.dart';
import '../styles/ecommerce_colors.dart';

/// A button to add products to the cart, with loading state support.
class AddToCartButton extends StatefulWidget {
  final VoidCallback onPressed; // Action when button is pressed
  final bool isLoading; // Whether the button shows a loading indicator
  final String label; // Customizable button text

  const AddToCartButton({
    Key? key,
    required this.onPressed,
    this.isLoading = false,
    this.label = 'Add to Cart',
  }) : super(key: key);

  @override
  _AddToCartButtonState createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:
          widget.isLoading || _loading
              ? null
              : () async {
                setState(() => _loading = true);
                await Future.delayed(
                  const Duration(seconds: 1),
                ); // Simulate processing
                setState(() => _loading = false);
                widget.onPressed();
              },
      style: EcommerceButtonStyles.primary,
      child:
          _loading || widget.isLoading
              ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
              : Text(widget.label),
    );
  }
}


/*
AddToCartButton(
  onPressed: () {
    print("Product added to cart!");
  },
)
*/


/*
Key Features of This Widget:
✅ Loading State Support – Shows a CircularProgressIndicator when clicked.
✅ Disables When Processing – Prevents multiple taps.
✅ Customizable Label – Default: "Add to Cart", but customizable.
*/