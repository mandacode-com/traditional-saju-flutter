import 'package:flutter/material.dart';

class PageInfoText extends StatelessWidget {
  const PageInfoText(
      {super.key,
      required this.title,
      required this.description,
      this.distance = 10});

  final String title;
  final String description;
  final double distance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            fontFamily: 'NanumSquareNeo',
          ),
        ),
        SizedBox(height: distance),
        Text(
          description,
          style: TextStyle(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 0.1
              ..color = Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: 'MapoFlowerIsland',
          ),
        ),
      ],
    );
  }
}
