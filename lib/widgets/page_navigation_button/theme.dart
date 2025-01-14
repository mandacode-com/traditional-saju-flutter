part of 'page_navigation_button.dart';

class PageNavigationButtonTheme {
  const PageNavigationButtonTheme();

  Color get backgroundColor => Colors.grey;
  Color get textColor => Colors.black;
}

class LightPageNavigationButtonTheme extends PageNavigationButtonTheme {
  const LightPageNavigationButtonTheme();

  @override
  Color get backgroundColor => Colors.white;
  @override
  Color get textColor => Colors.black;
}

class DarkPageNavigationButtonTheme extends PageNavigationButtonTheme {
  const DarkPageNavigationButtonTheme();

  @override
  Color get backgroundColor => Colors.black;
  @override
  Color get textColor => Colors.white;
}

class ObscurePageNavigationButtonTheme extends PageNavigationButtonTheme {
  const ObscurePageNavigationButtonTheme();

  @override
  Color get textColor => Colors.black;
  @override
  Color get backgroundColor => const Color.fromRGBO(255, 255, 255, 0.8);
}
