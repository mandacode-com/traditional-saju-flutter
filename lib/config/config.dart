import 'package:flutter/material.dart';

class Config {
  static EdgeInsets getLandScapeHorizontalPadding(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: MediaQuery.of(context).size.width / 4,
    );
  }
}
