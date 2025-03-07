import 'package:flutter/material.dart';
import '../utils/formatters.dart';
import '../styles/ecommerce_text_styles.dart';
import '../styles/ecommerce_colors.dart';

/// A reusable widget for displaying formatted product prices.
class PriceDisplay extends StatelessWidget {
  final double price;
  final double? oldPrice;
  final String currencySymbol;
  final TextStyle? style;
  final TextStyle? oldPriceStyle;
  final bool showOldPrice;

  const PriceDisplay({
    Key? key,
    required this.price,
    this.oldPrice,
    this.currencySymbol = '\$',
    this.style,
    this.oldPriceStyle,
    this.showOldPrice = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formattedPrice = Formatters.formatCurrency(price, symbol: currencySymbol);
    final formattedOldPrice = oldPrice != null ? Formatters.formatCurrency(oldPrice!, symbol: currencySymbol) : '';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Current Price
        Text(
          formattedPrice,
          style: style ?? EcommerceTextStyles.headline3.copyWith(color: EcommerceColors.primary),
        ),

        // Old Price (Strikethrough) if applicable
        if (showOldPrice && oldPrice != null && oldPrice! > price) ...[
          const SizedBox(width: 8), // Space between prices
          Text(
            formattedOldPrice,
            style: oldPriceStyle ??
                EcommerceTextStyles.bodyText2.copyWith(
                  color: EcommerceColors.textHint,
                  decoration: TextDecoration.lineThrough,
                ),
          ),
        ],
      ],
    );
  }
}



//how to use
/*
PriceDisplay(
  price: 49.99,
  oldPrice: 69.99, // Shows strikethrough discount
  currencySymbol: '€',
)
*/


/*
Key Features of This Widget:
✅ Formats Prices Dynamically – Uses Formatters.formatCurrency().
✅ Handles Discounts – Shows old price with a strikethrough if provided.
✅ Customizable Styles – Allows custom text styles for prices.
✅ Supports Different Currencies – Defaults to "$", but customizable ("€", "₹", etc.).
*/