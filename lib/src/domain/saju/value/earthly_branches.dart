import 'package:flutter/foundation.dart';
import 'package:traditional_saju_v1/src/domain/saju/value/earthly_branch.dart';

@immutable
class EarthlyBranches {
  const EarthlyBranches({
    required this.year,
    required this.month,
    required this.day,
    this.hour,
  });

  final EarthlyBranch year;
  final EarthlyBranch month;
  final EarthlyBranch day;
  final EarthlyBranch? hour;

  bool get hasHour => hour != null;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EarthlyBranches &&
        other.year == year &&
        other.month == month &&
        other.day == day &&
        other.hour == hour;
  }

  @override
  int get hashCode => Object.hash(year, month, day, hour);
}
