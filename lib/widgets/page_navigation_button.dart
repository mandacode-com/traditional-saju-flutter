import 'package:byul_mobile/themes/page_navigation_button_theme.dart';
import 'package:flutter/material.dart';

class PageNavigationButton extends StatelessWidget {
  const PageNavigationButton({
    super.key,
    required this.page,
    this.theme = const LightPageNavigationButtonTheme(),
    required this.text,
    this.onPressed,
  });

  final Size buttonMinimumSize = const Size(double.infinity, 50);

  final Widget page;
  final PageNavigationButtonTheme theme;
  final String text;
  final Future<void> Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: buttonMinimumSize,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26),
              ),
              backgroundColor: theme.backgroundColor,
              foregroundColor: theme.textColor,
            ),
            onPressed: () async {
              if (onPressed != null) {
                onPressed!();
              }
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            },
            child: Text(text),
          ),
        ),
      ],
    );
  }
}
