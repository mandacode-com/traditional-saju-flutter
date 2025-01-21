import 'package:flutter/material.dart';

class BottomPageNavigationButton extends StatelessWidget {
  const BottomPageNavigationButton({
    super.key,
    this.visible = true,
    required this.child,
    this.opacity = 1,
  });

  final bool visible;
  final Widget? child;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      // can modify this to access right
      visible: true,
      maintainAnimation: true,
      maintainState: true,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: opacity,
        curve: Curves.easeInOut,
        child: child,
      ),
    );
  }
}
