import 'package:flutter/material.dart';

/// Defines the button styles used in the eLearning module.
class ELearningButtonStyles extends ThemeExtension<ELearningButtonStyles> {
  final ButtonStyle primary;
  final ButtonStyle secondary;
  final ButtonStyle outlined;
  final ButtonStyle text;

  ELearningButtonStyles({
    required this.primary,
    required this.secondary,
    required this.outlined,
    required this.text,
  });

  /// Light theme button styles
  static final ELearningButtonStyles light = ELearningButtonStyles(
    primary: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF6200EA),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    secondary: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF03DAC6),
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    outlined: OutlinedButton.styleFrom(
      foregroundColor: const Color(0xFF6200EA),
      side: const BorderSide(color: Color(0xFF6200EA), width: 2),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    text: TextButton.styleFrom(
      foregroundColor: const Color(0xFF6200EA),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );

  /// Dark theme button styles
  static final ELearningButtonStyles dark = ELearningButtonStyles(
    primary: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFBB86FC),
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    secondary: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF03DAC6),
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    outlined: OutlinedButton.styleFrom(
      foregroundColor: const Color(0xFFBB86FC),
      side: const BorderSide(color: Color(0xFFBB86FC), width: 2),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    text: TextButton.styleFrom(
      foregroundColor: const Color(0xFFBB86FC),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );

  @override
  ELearningButtonStyles copyWith({
    ButtonStyle? primary,
    ButtonStyle? secondary,
    ButtonStyle? outlined,
    ButtonStyle? text,
  }) {
    return ELearningButtonStyles(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      outlined: outlined ?? this.outlined,
      text: text ?? this.text,
    );
  }

  @override
  ELearningButtonStyles lerp(ThemeExtension<ELearningButtonStyles>? other, double t) {
    if (other is! ELearningButtonStyles) return this;
    return ELearningButtonStyles(
      primary: ButtonStyle.lerp(primary, other.primary, t)!,
      secondary: ButtonStyle.lerp(secondary, other.secondary, t)!,
      outlined: ButtonStyle.lerp(outlined, other.outlined, t)!,
      text: ButtonStyle.lerp(text, other.text, t)!,
    );
  }
}

/// Provides easy access to button styles via `context.elearningButtonStyles`
extension ELearningButtonStylesExtension on BuildContext {
  ELearningButtonStyles get elearningButtonStyles {
    return Theme.of(this).extension<ELearningButtonStyles>() ?? ELearningButtonStyles.light;
  }
}


//usage example

//adding to theme
/*
ThemeData(
  extensions: [ELearningButtonStyles.light], // or ELearningButtonStyles.dark
)
*/

//using in widget
/*
ElevatedButton(
  style: context.elearningButtonStyles.primary,
  onPressed: () {
    // Handle button press
  },
  child: Text("Start Course"),
)
*/