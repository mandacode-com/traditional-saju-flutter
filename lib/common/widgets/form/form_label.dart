import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget {
  const FormLabel({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(label, style: Theme.of(context).textTheme.labelMedium),
    );
  }
}
