import 'package:flutter/material.dart';

/// Defines the primary colors used in the eLearning module.
class ELearningColors extends ThemeExtension<ELearningColors> {
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color background;
  final Color surface;
  final Color error;
  final Color success;
  final Color warning;
  final Color textPrimary;
  final Color textSecondary;
  final Color border;
  final Color shadow;

  ELearningColors({
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.background,
    required this.surface,
    required this.error,
    required this.success,
    required this.warning,
    required this.textPrimary,
    required this.textSecondary,
    required this.border,
    required this.shadow,
  });

  /// Define a light theme color palette
  static final ELearningColors light = ELearningColors(
    primary: const Color(0xFF6200EA), // Deep Purple
    secondary: const Color(0xFF03DAC6), // Teal
    accent: const Color(0xFFFFA726), // Orange
    background: const Color(0xFFF5F5F5), // Light Grey
    surface: const Color(0xFFFFFFFF), // White
    error: const Color(0xFFB00020), // Red
    success: const Color(0xFF00C853), // Green
    warning: const Color(0xFFFFD600), // Yellow
    textPrimary: const Color(0xFF212121), // Dark Text
    textSecondary: const Color(0xFF757575), // Grey Text
    border: const Color(0xFFBDBDBD), // Light Border
    shadow: Colors.black.withOpacity(0.2),
  );

  /// Define a dark theme color palette
  static final ELearningColors dark = ELearningColors(
    primary: const Color(0xFFBB86FC), // Lighter Purple
    secondary: const Color(0xFF03DAC6), // Teal
    accent: const Color(0xFFFFA726), // Orange
    background: const Color(0xFF121212), // Dark Grey
    surface: const Color(0xFF1E1E1E), // Darker Grey
    error: const Color(0xFFCF6679), // Red
    success: const Color(0xFF00E676), // Green
    warning: const Color(0xFFFFD600), // Yellow
    textPrimary: const Color(0xFFFFFFFF), // White Text
    textSecondary: const Color(0xFFB0BEC5), // Light Grey Text
    border: const Color(0xFF37474F), // Dark Border
    shadow: Colors.black.withOpacity(0.4),
  );

  @override
  ELearningColors copyWith({
    Color? primary,
    Color? secondary,
    Color? accent,
    Color? background,
    Color? surface,
    Color? error,
    Color? success,
    Color? warning,
    Color? textPrimary,
    Color? textSecondary,
    Color? border,
    Color? shadow,
  }) {
    return ELearningColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      accent: accent ?? this.accent,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      error: error ?? this.error,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      border: border ?? this.border,
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  ELearningColors lerp(ThemeExtension<ELearningColors>? other, double t) {
    if (other is! ELearningColors) return this;
    return ELearningColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      error: Color.lerp(error, other.error, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      border: Color.lerp(border, other.border, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
    );
  }
}

/// Provides quick access to theme colors.
extension ELearningThemeExtension on BuildContext {
  ELearningColors get elearningColors {
    return Theme.of(this).extension<ELearningColors>() ?? ELearningColors.light;
  }
}



//how to use

/*
ThemeData(
  extensions: [ELearningColors.light], // or ELearningColors.dark
)
*/