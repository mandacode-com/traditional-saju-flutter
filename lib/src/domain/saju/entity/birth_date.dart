import 'package:flutter/foundation.dart';

@immutable
class BirthDate {
  const BirthDate(this.value);

  final DateTime value;

  bool get isValid {
    final now = DateTime.now();
    final minDate = DateTime(1900);
    return value.isAfter(minDate) && value.isBefore(now);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BirthDate && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
