import 'package:intl/intl.dart';

/// A utility class for formatting various data types.
class Formatters {
  /// Formats a date to a readable string (e.g., "March 11, 2025").
  static String formatDate(DateTime date, {String format = 'MMMM d, y'}) {
    return DateFormat(format).format(date);
  }

  /// Formats a duration into a readable time format (e.g., "5:30" for 5 minutes 30 seconds).
  static String formatDuration(Duration duration) {
    String minutes = duration.inMinutes.toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  /// Formats a large number with commas (e.g., "1,234,567").
  static String formatNumber(int number) {
    return NumberFormat('#,###').format(number);
  }

  /// Formats a percentage value (e.g., "85%").
  static String formatPercentage(double value) {
    return "${(value * 100).toStringAsFixed(1)}%";
  }

  /// Formats a currency value (e.g., "$1,234.50").
  static String formatCurrency(double amount, {String locale = 'en_US', String symbol = '\$'}) {
    return NumberFormat.currency(locale: locale, symbol: symbol).format(amount);
  }

  /// Shortens a long text with ellipsis (e.g., "Introduction to Flut...").
  static String truncateText(String text, {int maxLength = 20}) {
    if (text.length <= maxLength) return text;
    return "${text.substring(0, maxLength)}...";
  }
}



//usage example
/*
void main() {
  print(Formatters.formatDate(DateTime.now())); // "March 11, 2025"
  print(Formatters.formatDuration(Duration(minutes: 5, seconds: 30))); // "05:30"
  print(Formatters.formatNumber(1234567)); // "1,234,567"
  print(Formatters.formatPercentage(0.85)); // "85%"
  print(Formatters.formatCurrency(1234.50)); // "$1,234.50"
  print(Formatters.truncateText("Introduction to Flutter Development", maxLength: 15)); // "Introduction..."
}
*/