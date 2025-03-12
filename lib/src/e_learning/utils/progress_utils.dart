/// A utility class for handling progress-related calculations in the eLearning module.
class ProgressUtils {
  /// Calculates the progress percentage given completed and total items.
  /// Returns a value between 0.0 and 1.0.
  static double calculateProgress(int completed, int total) {
    if (total == 0) return 0.0; // Prevent division by zero
    return (completed / total).clamp(0.0, 1.0);
  }

  /// Converts progress (0.0 to 1.0) into a percentage string (e.g., "75%").
  static String progressToPercentage(double progress) {
    return "${(progress * 100).toStringAsFixed(1)}%";
  }

  /// Estimates the remaining time based on the average time per item.
  /// Returns the time in minutes.
  static int estimateRemainingTime(int completed, int total, int averageTimePerItem) {
    if (completed == 0) return total * averageTimePerItem;
    int remainingItems = total - completed;
    return remainingItems * averageTimePerItem;
  }

  /// Determines if a course or lesson is completed based on progress.
  static bool isCompleted(double progress) {
    return progress >= 1.0;
  }
}


//ugage example
/*
void main() {
  int completedLessons = 6;
  int totalLessons = 10;
  int avgTimePerLesson = 5; // in minutes

  double progress = ProgressUtils.calculateProgress(completedLessons, totalLessons);
  print(ProgressUtils.progressToPercentage(progress)); // "60.0%"
  print(ProgressUtils.estimateRemainingTime(completedLessons, totalLessons, avgTimePerLesson)); // 20 minutes
  print(ProgressUtils.isCompleted(progress)); // false
}
*/