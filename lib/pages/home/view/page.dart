import 'package:flutter/material.dart';
import 'package:saju_mobile_v1/common/widgets/layouts/adaptive_column.dart';
import 'package:saju_mobile_v1/common/widgets/layouts/main_background.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: AdaptiveColumn(
            children: [
              _HomePageTitle(title: '정통사주', description: '정확하게 들어맞는 정통사주풀이'),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomePageTitle extends StatelessWidget {
  const _HomePageTitle({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'SSRock',
            fontWeight: FontWeight.normal,
            fontSize: 40,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        Text(
          description,
          style: const TextStyle(
            fontFamily: 'MapoFlowerIsland',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
