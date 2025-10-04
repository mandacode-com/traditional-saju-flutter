import 'package:flutter/material.dart';
import 'package:traditional_saju/src/presentation/app/theme/app_colors.dart';

/// Application text styles organized by use case
abstract class AppTextStyles {
  // Headline styles
  static const TextStyle headlineLarge = TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w800,
    fontFamily: 'NanumSquareNeo',
    fontSize: 20,
  );

  static const TextStyle headlineMedium = TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w700,
    fontFamily: 'MapoFlowerIsland',
    fontSize: 13,
  );

  // Body styles
  static const TextStyle bodyMedium = TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w500,
    fontFamily: 'NanumSquareNeo',
    fontSize: 13,
  );

  static const TextStyle bodyLarge = TextStyle(
    color: AppColors.textPrimary,
  );

  // Button text styles
  static const TextStyle button = TextStyle(
    fontFamily: 'NanumSquareNeo',
    fontSize: 13,
    fontWeight: FontWeight.w700,
  );
}
