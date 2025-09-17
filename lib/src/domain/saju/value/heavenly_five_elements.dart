import 'package:flutter/foundation.dart';
import 'package:traditional_saju_v1/src/domain/saju/value/five_element.dart';

@immutable
class HeavenlyFiveElements {
  const HeavenlyFiveElements({
    required this.year,
    required this.month,
    required this.day,
    this.hour,
  });

  final FiveElement year;
  final FiveElement month;
  final FiveElement day;
  final FiveElement? hour;

  bool get hasHour => hour != null;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HeavenlyFiveElements &&
        other.year == year &&
        other.month == month &&
        other.day == day &&
        other.hour == hour;
  }

  @override
  int get hashCode => Object.hash(year, month, day, hour);
}
