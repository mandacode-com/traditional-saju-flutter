import 'package:flutter/material.dart';

/// Reusable form input widget with consistent styling
class FormInput extends StatelessWidget {
  const FormInput({
    required this.child,
    super.key,
    this.isActive = false,
    this.forceTextActive = false,
    this.padding = const EdgeInsets.all(16),
    this.minHeight = 0,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.onPressed,
  });

  final Widget child;
  final bool isActive;
  final bool forceTextActive;
  final EdgeInsets padding;
  final double minHeight;
  final BorderRadius borderRadius;
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: padding,
        constraints: BoxConstraints(minHeight: minHeight),
        decoration: BoxDecoration(
          color: isActive ? Colors.black : const Color(0xFFFAFAFA),
          borderRadius: borderRadius,
          border: Border.all(
            color: isActive ? Colors.white : Colors.transparent,
            width: 0.8,
          ),
        ),
        child: DefaultTextStyle(
          style:
              Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isActive || forceTextActive
                    ? Colors.white
                    : Colors.grey[600],
              ) ??
              TextStyle(
                color: isActive || forceTextActive
                    ? Colors.white
                    : Colors.grey[600],
              ),
          child: child,
        ),
      ),
    );
  }
}
