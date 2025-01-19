import 'package:flutter/material.dart';

class PageBackButton extends StatelessWidget {
  const PageBackButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: onPressed,
    );
  }
}
