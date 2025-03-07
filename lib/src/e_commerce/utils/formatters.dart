import 'package:intl/intl.dart';

/// A utility class for formatting currency, dates, and other common values.
class Formatters {
  /// Formats a price as currency (e.g., `$1,234.56` or `€1.234,56` depending on locale).
  static String formatCurrency(double amount, {String locale = 'en_US', String symbol = '\$'}) {
    final format = NumberFormat.currency(locale: locale, symbol: symbol);
    return format.format(amount);
  }

  /// Formats a date into a readable string (e.g., `March 5, 2025`).
  static String formatDate(DateTime date, {String format = 'MMMM d, y', String locale = 'en_US'}) {
    final formatter = DateFormat(format, locale);
    return formatter.format(date);
  }

  /// Formats a date to a shorter version (e.g., `Mar 5, 2025`).
  static String formatShortDate(DateTime date, {String locale = 'en_US'}) {
    return DateFormat.yMMMd(locale).format(date);
  }

  /// Formats a time (e.g., `03:45 PM`).
  static String formatTime(DateTime date, {String locale = 'en_US'}) {
    return DateFormat.jm(locale).format(date);
  }

  /// Formats numbers with thousands separators (e.g., `1,000,000`).
  static String formatNumber(int number, {String locale = 'en_US'}) {
    final format = NumberFormat.decimalPattern(locale);
    return format.format(number);
  }

  /// Capitalizes the first letter of a string.
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  /// Truncates a string to a given length, adding `...` if needed.
  static String truncate(String text, {int maxLength = 30}) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }
}


//how to use
/*
void main() {
  print(Formatters.formatCurrency(1234.56)); // Output: $1,234.56
  print(Formatters.formatDate(DateTime.now())); // Output: March 5, 2025
  print(Formatters.formatShortDate(DateTime.now())); // Output: Mar 5, 2025
  print(Formatters.formatNumber(1000000)); // Output: 1,000,000
  print(Formatters.capitalize('hello world')); // Output: Hello world
  print(Formatters.truncate('This is a long product description', maxLength: 20)); // Output: This is a long pro...
}
*/


/*
Key Features of This Code:
✅ Currency Formatting – Automatically adapts to locale & symbol (USD, EUR, etc.).
✅ Date & Time Formatting – Supports multiple formats (March 5, 2025, Mar 5, 2025).
✅ Number Formatting – Adds thousands separators (1,000,000).
✅ Text Helpers – Includes capitalize and truncate functions for UI display.
*/