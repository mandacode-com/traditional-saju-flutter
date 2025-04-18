import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.onPressed,
    required this.child,
    super.key,
    this.width,
    this.height = 50,
    this.background,
    this.foreground,
    this.decoration,
    this.disabled = false,
  });
  final Widget child;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final WidgetStateProperty<Color?>? background;
  final WidgetStateProperty<Color?>? foreground;
  final Decoration? decoration;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    if (disabled) {
      return Container(
        width: width,
        height: height,
        decoration: decoration,
        child: TextButton(
          style: Theme.of(context).textButtonTheme.style?.copyWith(
            backgroundColor: WidgetStateProperty.all(Colors.grey[300]),
            foregroundColor: foreground,
          ),
          onPressed: null,
          child: child,
        ),
      );
    }
    return Container(
      width: width,
      height: height,
      decoration: decoration,
      child: TextButton(
        style: Theme.of(context).textButtonTheme.style?.copyWith(
          backgroundColor: background,
          foregroundColor: foreground,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
