import 'package:flutter/material.dart';

class MainBackground extends StatelessWidget {
  const MainBackground({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/main_background.png'),
          alignment: Alignment.bottomRight,
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
