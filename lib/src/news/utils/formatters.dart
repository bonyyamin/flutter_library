import 'package:intl/intl.dart';

class Formatters {
  // Format a DateTime to a human-readable "time ago" format
  static String timeAgo(DateTime date) {
    final Duration difference = DateTime.now().difference(date);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} sec ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return DateFormat('MMMM d, y').format(date); // Example: March 6, 2025
    }
  }

  // Format a DateTime to a standard readable date
  static String formatDate(DateTime date, {String format = 'MMMM d, y'}) {
    return DateFormat(format).format(date);
  }

  // Format a large number to a short readable form (e.g., 1.2K, 3.5M)
  static String formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    } else {
      return number.toString();
    }
  }

  // Capitalize the first letter of a string
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  // Truncate text with "..." if it's too long
  static String truncate(String text, {int maxLength = 100}) {
    if (text.length > maxLength) {
      return '${text.substring(0, maxLength)}...';
    }
    return text;
  }
}


//how to use

//Format "time ago"
/*
String time = Formatters.timeAgo(DateTime.now().subtract(Duration(hours: 5)));
// Output: "5 hours ago"
*/

//Format a Date
/*
String date = Formatters.formatDate(DateTime.now());
// Output: "March 6, 2025"
*/

//Format Large Numbers
/*
String views = Formatters.formatNumber(12500);
// Output: "12.5K"
*/

//Capitalize Text
/*
String title = Formatters.capitalize("breaking news today");
// Output: "Breaking news today"
*/

//Truncate Long Text
/*
String summary = Formatters.truncate("This is a very long news article summary...", maxLength: 20);
// Output: "This is a very long..."
*/
