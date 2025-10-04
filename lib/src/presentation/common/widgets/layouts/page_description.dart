import 'package:flutter/material.dart';

/// Page description widget showing title and subtitle
class PageDescription extends StatelessWidget {
  const PageDescription({
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 14,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            fontFamily: 'MapoFlowerIsland',
          ),
        ),
      ],
    );
  }
}
