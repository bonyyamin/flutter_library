import 'dart:ui';

import 'package:flutter/material.dart';

/// Defines the card styles used in the eLearning module.
class ELearningCardStyles extends ThemeExtension<ELearningCardStyles> {
  final Color background;
  final Color shadow;
  final double elevation;
  final double borderRadius;
  final EdgeInsets padding;
  final BorderSide border;

  ELearningCardStyles({
    required this.background,
    required this.shadow,
    required this.elevation,
    required this.borderRadius,
    required this.padding,
    required this.border,
  });

  /// Light theme card styles
  static final ELearningCardStyles light = ELearningCardStyles(
    background: Colors.white,
    shadow: Colors.black.withOpacity(0.1),
    elevation: 4.0,
    borderRadius: 12.0,
    padding: const EdgeInsets.all(16.0),
    border: BorderSide(color: Colors.grey.shade300, width: 1),
  );

  /// Dark theme card styles
  static final ELearningCardStyles dark = ELearningCardStyles(
    background: const Color(0xFF1E1E1E),
    shadow: Colors.black.withOpacity(0.3),
    elevation: 6.0,
    borderRadius: 12.0,
    padding: const EdgeInsets.all(16.0),
    border: BorderSide(color: Colors.grey.shade700, width: 1),
  );

  @override
  ELearningCardStyles copyWith({
    Color? background,
    Color? shadow,
    double? elevation,
    double? borderRadius,
    EdgeInsets? padding,
    BorderSide? border,
  }) {
    return ELearningCardStyles(
      background: background ?? this.background,
      shadow: shadow ?? this.shadow,
      elevation: elevation ?? this.elevation,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      border: border ?? this.border,
    );
  }

  @override
  ELearningCardStyles lerp(ThemeExtension<ELearningCardStyles>? other, double t) {
    if (other is! ELearningCardStyles) return this;
    return ELearningCardStyles(
      background: Color.lerp(background, other.background, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      elevation: lerpDouble(elevation, other.elevation, t)!,
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t)!,
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
      border: BorderSide.lerp(border, other.border, t),
    );
  }
}

/// Provides easy access to card styles via `context.elearningCardStyles`
extension ELearningCardStylesExtension on BuildContext {
  ELearningCardStyles get elearningCardStyles {
    return Theme.of(this).extension<ELearningCardStyles>() ?? ELearningCardStyles.light;
  }
}


//usage example

//adding to theme
/*
ThemeData(
  extensions: [ELearningCardStyles.light], // or ELearningCardStyles.dark
)
*/

//using in widget
/*
Container(
  padding: context.elearningCardStyles.padding,
  decoration: BoxDecoration(
    color: context.elearningCardStyles.background,
    borderRadius: BorderRadius.circular(context.elearningCardStyles.borderRadius),
    boxShadow: [
      BoxShadow(
        color: context.elearningCardStyles.shadow,
        blurRadius: context.elearningCardStyles.elevation,
      ),
    ],
    border: Border.fromBorderSide(context.elearningCardStyles.border),
  ),
  child: Text(
    "Course Title",
    style: Theme.of(context).textTheme.headline6,
  ),
)
*/