import 'package:flutter/material.dart';

/// Custom back button for pages
class PageBackButton extends StatelessWidget {
  const PageBackButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: onPressed,
    );
  }
}
