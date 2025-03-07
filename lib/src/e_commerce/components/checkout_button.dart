import 'package:flutter/material.dart';
import '../styles/ecommerce_button_styles.dart';
import '../styles/ecommerce_colors.dart';

/// A button to initiate the checkout process, with a loading state.
class CheckoutButton extends StatefulWidget {
  final VoidCallback onCheckout;
  final bool isLoading;
  final String label;

  const CheckoutButton({
    Key? key,
    required this.onCheckout,
    this.isLoading = false,
    this.label = "Proceed to Checkout",
  }) : super(key: key);

  @override
  _CheckoutButtonState createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: widget.isLoading || _loading
            ? null
            : () async {
                setState(() => _loading = true);
                await Future.delayed(const Duration(seconds: 1)); // Simulate checkout processing
                setState(() => _loading = false);
                widget.onCheckout();
              },
        style: EcommerceButtonStyles.primary,
        child: _loading || widget.isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Text(widget.label, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}


//how to use
/*
CheckoutButton(
  onCheckout: () {
    print("Checkout process started!");
  },
)
*/


/*
Key Features of This Button:
✅ Loading Indicator – Shows a CircularProgressIndicator when tapped.
✅ Disables When Processing – Prevents multiple taps.
✅ Customizable Label – Defaults to "Proceed to Checkout", but customizable.
*/