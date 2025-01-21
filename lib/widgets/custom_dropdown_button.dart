import 'package:byul_mobile/themes/button_color.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomDropdownButton<T> extends StatelessWidget {
  const CustomDropdownButton(
      {super.key,
      required this.items,
      required this.onChanged,
      required this.value,
      this.disabled = false});

  final List<DropdownMenuItem<T>> items;
  final void Function(T?) onChanged;
  final T value;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: ButtonTheme(
      alignedDropdown: true,
      child: DropdownButton<T>(
        alignment: Alignment.center,
        borderRadius: BorderRadius.circular(8),
        menuMaxHeight: 200,
        focusColor: Colors.black,
        icon: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Transform.rotate(
            angle: 90 * math.pi / 180,
            child: Icon(Icons.arrow_forward_ios, size: 13, color: Colors.black),
          ),
        ),
        isExpanded: true,
        items: items,
        onChanged: disabled ? null : onChanged,
        style: TextStyle(color: ButtonColor.blackText),
        value: value,
      ),
    ));
  }
}
