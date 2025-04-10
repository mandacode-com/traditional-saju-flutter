import 'package:flutter/material.dart';

class TextCheckBox extends StatelessWidget {
  const TextCheckBox({
    required this.text,
    required this.value,
    required this.onChanged,
    this.textStyle,
    super.key,
  });

  final String text;
  final bool value;
  final ValueChanged<bool?> onChanged;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: value, onChanged: onChanged),
        Text(
          text,
          style: textStyle ??
              Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
        ),
      ],
    );
  }
}
