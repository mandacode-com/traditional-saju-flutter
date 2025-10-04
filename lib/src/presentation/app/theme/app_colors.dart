import 'package:flutter/material.dart';

/// Application color palette
abstract class AppColors {
  // Primary colors
  static const Color primary = Color(0xFF000000);
  static const Color secondary = Color(0xFFFFFFFF);

  // Background colors
  static const Color scaffoldBackground = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFFDFBF3);

  // Form colors
  static const Color formInputActive = Colors.black;
  static const Color formInputInactive = Color(0xFFFAFAFA);

  // Text colors
  static const Color textPrimary = Colors.black;
  static const Color textSecondary = Colors.white;

  // Button colors
  static const Color buttonPrimary = Color(0xFF000000);
  static const Color buttonSecondary = Color(0xFFFFFFFF);

  // Checkbox colors
  static const Color checkboxSelected = Colors.black;
  static const Color checkboxUnselected = Colors.transparent;
  static const Color checkboxDisabled = Colors.black12;

  // Shadow colors
  static const Color shadow = Colors.transparent;
}
