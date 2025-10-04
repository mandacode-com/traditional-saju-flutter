import 'package:flutter/material.dart';
import 'package:traditional_saju/src/presentation/app/theme/app_colors.dart';
import 'package:traditional_saju/src/presentation/app/theme/app_text_styles.dart';

/// Component-specific theme configurations
abstract class ComponentThemes {
  /// AppBar theme configuration
  static const AppBarTheme appBar = AppBarTheme(
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
  );

  /// Checkbox theme configuration
  static const CheckboxThemeData checkbox = CheckboxThemeData(
    checkColor: WidgetStatePropertyAll(Colors.white),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(3)),
    ),
    fillColor: WidgetStateProperty.fromMap(<WidgetStatesConstraint, Color?>{
      WidgetState.selected: AppColors.checkboxSelected,
      WidgetState.focused: AppColors.checkboxSelected,
      WidgetState.error: AppColors.checkboxSelected,
      WidgetState.disabled: AppColors.checkboxDisabled,
      WidgetState.any: AppColors.checkboxUnselected,
    }),
    overlayColor: WidgetStatePropertyAll(Colors.transparent),
  );

  /// TextButton theme configuration
  static TextButtonThemeData textButton = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.textSecondary,
      backgroundColor: AppColors.buttonPrimary,
    ),
  );

  /// ElevatedButton theme configuration
  static ElevatedButtonThemeData elevatedButton = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: AppTextStyles.button,
      foregroundColor: AppColors.textSecondary,
      backgroundColor: AppColors.buttonPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      shadowColor: AppColors.shadow,
    ),
  );

  /// Icon theme configuration
  static const IconThemeData icon = IconThemeData(
    color: AppColors.textPrimary,
  );
}
