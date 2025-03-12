import 'dart:ui';

import 'package:flutter/material.dart';

/// Defines the progress indicator styles used in the eLearning module.
class ELearningProgressIndicatorStyles extends ThemeExtension<ELearningProgressIndicatorStyles> {
  final Color color;
  final double strokeWidth;
  final double size;
  final Color backgroundColor;

  ELearningProgressIndicatorStyles({
    required this.color,
    required this.strokeWidth,
    required this.size,
    required this.backgroundColor,
  });

  /// Light theme progress indicator styles
  static final ELearningProgressIndicatorStyles light = ELearningProgressIndicatorStyles(
    color: const Color(0xFF6200EA), // Primary Color
    strokeWidth: 4.0,
    size: 40.0,
    backgroundColor: Colors.grey.shade300,
  );

  /// Dark theme progress indicator styles
  static final ELearningProgressIndicatorStyles dark = ELearningProgressIndicatorStyles(
    color: const Color(0xFFBB86FC), // Lighter Purple
    strokeWidth: 4.0,
    size: 40.0,
    backgroundColor: Colors.grey.shade800,
  );

  @override
  ELearningProgressIndicatorStyles copyWith({
    Color? color,
    double? strokeWidth,
    double? size,
    Color? backgroundColor,
  }) {
    return ELearningProgressIndicatorStyles(
      color: color ?? this.color,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      size: size ?? this.size,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  ELearningProgressIndicatorStyles lerp(
      ThemeExtension<ELearningProgressIndicatorStyles>? other, double t) {
    if (other is! ELearningProgressIndicatorStyles) return this;
    return ELearningProgressIndicatorStyles(
      color: Color.lerp(color, other.color, t)!,
      strokeWidth: lerpDouble(strokeWidth, other.strokeWidth, t)!,
      size: lerpDouble(size, other.size, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
    );
  }
}

/// Provides easy access to progress indicator styles via `context.elearningProgressIndicatorStyles`
extension ELearningProgressIndicatorStylesExtension on BuildContext {
  ELearningProgressIndicatorStyles get elearningProgressIndicatorStyles {
    return Theme.of(this).extension<ELearningProgressIndicatorStyles>() ?? ELearningProgressIndicatorStyles.light;
  }
}


//usage example

//adding to theme
/*
ThemeData(
  extensions: [ELearningProgressIndicatorStyles.light], // or ELearningProgressIndicatorStyles.dark
)
*/

//using in widget
/*
SizedBox(
  width: context.elearningProgressIndicatorStyles.size,
  height: context.elearningProgressIndicatorStyles.size,
  child: CircularProgressIndicator(
    strokeWidth: context.elearningProgressIndicatorStyles.strokeWidth,
    color: context.elearningProgressIndicatorStyles.color,
    backgroundColor: context.elearningProgressIndicatorStyles.backgroundColor,
  ),
)
*/