import 'package:flutter/material.dart';

class TextCheckBox extends StatelessWidget {
  const TextCheckBox({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
  });

  final String text;
  final bool value;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: 'NanumSquareNeo'),
        ),
      ],
    );
  }
}
