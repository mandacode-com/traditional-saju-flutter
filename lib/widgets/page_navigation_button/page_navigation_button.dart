import 'package:flutter/material.dart';

part 'theme.dart';

class PageNavigationButton extends StatelessWidget {
  const PageNavigationButton({
    super.key,
    required this.page,
    this.theme = const LightPageNavigationButtonTheme(),
    required this.text,
  });

  final Size buttonMinimumSize = const Size(double.infinity, 50);

  final StatelessWidget page;
  final PageNavigationButtonTheme theme;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.backgroundColor,
          foregroundColor: theme.textColor,
          minimumSize: buttonMinimumSize,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Text(text));
  }
}

