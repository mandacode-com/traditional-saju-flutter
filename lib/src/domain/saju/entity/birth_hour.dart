import 'package:flutter/foundation.dart';

@immutable
class BirthHour {
  const BirthHour(this.value);

  final int value;

  bool get isValid => value >= 0 && value <= 23;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BirthHour && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
