import 'package:flutter/foundation.dart';

@immutable
class BirthMinutes {
  const BirthMinutes(this.value);

  final int value;

  bool get isValid => value >= 0 && value <= 59;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BirthMinutes && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
