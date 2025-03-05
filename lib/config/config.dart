import 'package:flutter/material.dart';

class Config {
  static EdgeInsets getLandScapeHorizontalPadding(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: MediaQuery.of(context).size.width / 4,
    );
  }

  static const EdgeInsets verticalHomePadding = EdgeInsets.symmetric(
    vertical: 120,
    horizontal: 20,
  );
  static const EdgeInsets horizontalHomePadding = EdgeInsets.symmetric(
    vertical: 40,
    horizontal: 40,
  );

  static const EdgeInsets verticalPagePadding = EdgeInsets.symmetric(
    vertical: 80,
    horizontal: 30,
  );
  static const EdgeInsets horizontalPagePadding = EdgeInsets.symmetric(
    vertical: 40,
  );
  static const EdgeInsets bottomNavigationPadding =
      EdgeInsets.only(left: 20, right: 20, bottom: 40);

  static const double pageInfoTextSpacingVertical = 80;
  static const double pageInfoTextSpacingHorizontal = 40;

  static const double formSpacing = 30;
  static const double formFieldSpacing = 10;
}
