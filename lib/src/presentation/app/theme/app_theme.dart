import 'package:flutter/material.dart';
import 'package:traditional_saju/src/presentation/app/theme/app_colors.dart';
import 'package:traditional_saju/src/presentation/app/theme/app_text_styles.dart';
import 'package:traditional_saju/src/presentation/app/theme/component_themes.dart';

/// Application theme configuration
abstract class AppTheme {
  /// Light theme configuration
  static ThemeData get light => ThemeData(
    // Primary colors
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.scaffoldBackground,

    // Color scheme
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),

    // Text theme
    textTheme: ThemeData.light().textTheme.copyWith(
      headlineLarge: AppTextStyles.headlineLarge,
      headlineMedium: AppTextStyles.headlineMedium,
      bodyMedium: AppTextStyles.bodyMedium,
      bodyLarge: AppTextStyles.bodyLarge,
    ),

    // Component themes
    appBarTheme: ComponentThemes.appBar,
    checkboxTheme: ComponentThemes.checkbox,
    textButtonTheme: ComponentThemes.textButton,
    elevatedButtonTheme: ComponentThemes.elevatedButton,
    iconTheme: ComponentThemes.icon,

    // Material 3
    useMaterial3: true,
  );

  /// Dark theme configuration (if needed in the future)
  static ThemeData get dark => light; // Use light theme for now
}
