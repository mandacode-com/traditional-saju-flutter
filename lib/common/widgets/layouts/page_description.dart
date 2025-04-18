import 'package:flutter/material.dart';

class PageDiscription extends StatelessWidget {
  const PageDiscription({
    required this.title,
    required this.subtitle,
    this.titleFontSize,
    this.subtitleFontSize,
    super.key,
  });

  final String title;
  final String subtitle;
  final double? titleFontSize;
  final double? subtitleFontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge?.copyWith(fontSize: titleFontSize),
        ),
        Text(
          subtitle,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontSize: subtitleFontSize),
        ),
      ],
    );
  }
}
