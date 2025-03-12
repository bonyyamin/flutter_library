import 'package:flutter/material.dart';

/// Defines the text styles used in the eLearning module.
class ELearningTextStyles extends ThemeExtension<ELearningTextStyles> {
  final TextStyle headline1;
  final TextStyle headline2;
  final TextStyle headline3;
  final TextStyle bodyText1;
  final TextStyle bodyText2;
  final TextStyle subtitle1;
  final TextStyle subtitle2;
  final TextStyle button;
  final TextStyle caption;
  final TextStyle overline;

  ELearningTextStyles({
    required this.headline1,
    required this.headline2,
    required this.headline3,
    required this.bodyText1,
    required this.bodyText2,
    required this.subtitle1,
    required this.subtitle2,
    required this.button,
    required this.caption,
    required this.overline,
  });

  /// Light theme text styles
  static final ELearningTextStyles light = ELearningTextStyles(
    headline1: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
    headline2: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
    headline3: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
    bodyText1: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black87),
    bodyText2: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black54),
    subtitle1: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87),
    subtitle2: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black54),
    button: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    caption: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black54),
    overline: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Colors.black45),
  );

  /// Dark theme text styles
  static final ELearningTextStyles dark = ELearningTextStyles(
    headline1: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
    headline2: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
    headline3: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
    bodyText1: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white70),
    bodyText2: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white60),
    subtitle1: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white70),
    subtitle2: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white60),
    button: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
    caption: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white60),
    overline: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Colors.white54),
  );

  @override
  ELearningTextStyles copyWith({
    TextStyle? headline1,
    TextStyle? headline2,
    TextStyle? headline3,
    TextStyle? bodyText1,
    TextStyle? bodyText2,
    TextStyle? subtitle1,
    TextStyle? subtitle2,
    TextStyle? button,
    TextStyle? caption,
    TextStyle? overline,
  }) {
    return ELearningTextStyles(
      headline1: headline1 ?? this.headline1,
      headline2: headline2 ?? this.headline2,
      headline3: headline3 ?? this.headline3,
      bodyText1: bodyText1 ?? this.bodyText1,
      bodyText2: bodyText2 ?? this.bodyText2,
      subtitle1: subtitle1 ?? this.subtitle1,
      subtitle2: subtitle2 ?? this.subtitle2,
      button: button ?? this.button,
      caption: caption ?? this.caption,
      overline: overline ?? this.overline,
    );
  }

  @override
  ELearningTextStyles lerp(ThemeExtension<ELearningTextStyles>? other, double t) {
    if (other is! ELearningTextStyles) return this;
    return ELearningTextStyles(
      headline1: TextStyle.lerp(headline1, other.headline1, t)!,
      headline2: TextStyle.lerp(headline2, other.headline2, t)!,
      headline3: TextStyle.lerp(headline3, other.headline3, t)!,
      bodyText1: TextStyle.lerp(bodyText1, other.bodyText1, t)!,
      bodyText2: TextStyle.lerp(bodyText2, other.bodyText2, t)!,
      subtitle1: TextStyle.lerp(subtitle1, other.subtitle1, t)!,
      subtitle2: TextStyle.lerp(subtitle2, other.subtitle2, t)!,
      button: TextStyle.lerp(button, other.button, t)!,
      caption: TextStyle.lerp(caption, other.caption, t)!,
      overline: TextStyle.lerp(overline, other.overline, t)!,
    );
  }
}

/// Provides easy access to text styles via `context.elearningTextStyles`
extension ELearningTextStylesExtension on BuildContext {
  ELearningTextStyles get elearningTextStyles {
    return Theme.of(this).extension<ELearningTextStyles>() ?? ELearningTextStyles.light;
  }
}


//how to use

//adding to theme
/*
ThemeData(
  extensions: [ELearningTextStyles.light], // or ELearningTextStyles.dark
)
*/

//using in widget
/*
Text(
  "Welcome to eLearning",
  style: context.elearningTextStyles.headline1,
);
*/