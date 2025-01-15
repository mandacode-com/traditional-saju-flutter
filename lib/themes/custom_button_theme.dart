import 'package:flutter/material.dart';

class CustomButtonTheme {
  CustomButtonTheme();

  CustomButtonBackground background = CustomButtonBackground();
  CustomButtonForeground foreground = CustomButtonForeground();
}

class CustomButtonBackground {
  CustomButtonBackground();

  Color white = Colors.white;
  Color black = Colors.black;
  Color obscureWhite = Color.fromRGBO(255, 255, 255, 0.8);
}

class CustomButtonForeground {
  Color white = Colors.white;
  Color black = Colors.black;
}
