import 'package:flutter/material.dart';

class AdaptiveColumn extends StatelessWidget {
  const AdaptiveColumn({
    required this.children,
    super.key,
    this.portraitPadding = const EdgeInsets.symmetric(
      vertical: 100,
      horizontal: 20,
    ),
    this.landscapePadding = const EdgeInsets.symmetric(
      vertical: 100,
      horizontal: 100,
    ),
    this.forceSpaceBetween = false,
    this.spacing = 0,
  });
  final List<Widget> children;
  final EdgeInsets portraitPadding;
  final EdgeInsets landscapePadding;
  final bool forceSpaceBetween;
  final double spacing;
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final padding = (orientation == Orientation.portrait)
        ? portraitPadding
        : landscapePadding;
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            padding: padding,
            child: Column(
              spacing: spacing,
              mainAxisAlignment: forceSpaceBetween
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.start,
              children: children,
            ),
          ),
        );
      },
    );
  }
}
