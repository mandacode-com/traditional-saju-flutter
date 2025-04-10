import 'dart:math' as math;
import 'package:flutter/material.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  const CustomDropdownButton({
    required this.items,
    required this.onChanged,
    required this.value,
    this.disabled = false,
    super.key,
  });

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
            padding: const EdgeInsets.only(left: 10),
            child: Transform.rotate(
              angle: 90 * math.pi / 180,
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 13,
                color: Colors.black,
              ),
            ),
          ),
          isExpanded: true,
          items: items,
          onChanged: disabled ? null : onChanged,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black,
              ),
          value: value,
        ),
      ),
    );
  }
}
