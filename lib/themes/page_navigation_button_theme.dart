import 'package:byul_mobile/themes/button_color.dart';
import 'package:flutter/material.dart';

class PageNavigationButtonTheme {
  const PageNavigationButtonTheme();

  Color get backgroundColor => ButtonColor.white;
  Color get textColor => ButtonColor.blackText;
}

class LightPageNavigationButtonTheme extends PageNavigationButtonTheme {
  const LightPageNavigationButtonTheme();

  @override
  Color get backgroundColor => ButtonColor.white;
  @override
  Color get textColor => ButtonColor.blackText;
}

class DarkPageNavigationButtonTheme extends PageNavigationButtonTheme {
  const DarkPageNavigationButtonTheme();

  @override
  Color get backgroundColor => ButtonColor.obsureBlack;
  @override
  Color get textColor => ButtonColor.whiteText;
}

class ObscurePageNavigationButtonTheme extends PageNavigationButtonTheme {
  const ObscurePageNavigationButtonTheme();

  @override
  Color get textColor => ButtonColor.blackText;
  @override
  Color get backgroundColor => ButtonColor.obsureWhite;
}
