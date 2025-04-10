import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.width,
    this.height = 50,
    this.background,
    this.foreground,
    this.decoration,
  });
  final String label;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Color? background;
  final Color? foreground;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: decoration,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: background ?? const Color(0xCC000000),
          foregroundColor: foreground ?? Colors.white,
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
