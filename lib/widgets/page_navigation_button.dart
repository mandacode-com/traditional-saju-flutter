import 'package:flutter/material.dart';

class PageNavigationButton extends StatelessWidget {
  const PageNavigationButton({super.key, this.onPressed, required this.text});

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlue,
        ),
        onPressed: onPressed,
        child: Text(style: TextStyle(color: Colors.white), text));
  }
}
