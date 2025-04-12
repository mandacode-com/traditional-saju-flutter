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
  });
  final Widget child;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final WidgetStateProperty<Color?>? background;
  final WidgetStateProperty<Color?>? foreground;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: decoration,
      child: TextButton(
        // style: TextButton.styleFrom(
        //   backgroundColor: background ?? const Color(0xCC000000),
        //   foregroundColor: foreground ?? Colors.white,
        // ),
        style: Theme.of(context).textButtonTheme.style?.copyWith(
              backgroundColor: background,
              foregroundColor: foreground,
            ),
        onPressed: onPressed,
        // child: Text(label),
        child: child,
      ),
    );
  }
}
