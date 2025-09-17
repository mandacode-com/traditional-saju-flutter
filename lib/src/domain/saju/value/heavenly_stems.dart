import 'package:flutter/foundation.dart';
import 'package:traditional_saju_v1/src/domain/saju/value/heavenly_stem.dart';

@immutable
class HeavenlyStems {
  const HeavenlyStems({
    required this.year,
    required this.month,
    required this.day,
    this.hour,
  });

  final HeavenlyStem year;
  final HeavenlyStem month;
  final HeavenlyStem day;
  final HeavenlyStem? hour;

  bool get hasHour => hour != null;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HeavenlyStems &&
        other.year == year &&
        other.month == month &&
        other.day == day &&
        other.hour == hour;
  }

  @override
  int get hashCode => Object.hash(year, month, day, hour);
}
