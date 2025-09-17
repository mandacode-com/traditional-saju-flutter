import 'package:flutter/foundation.dart';
import 'package:traditional_saju_v1/src/domain/saju/value/earthly_branches.dart';
import 'package:traditional_saju_v1/src/domain/saju/value/earthly_five_elements.dart';

@immutable
class ChartEarthly {
  const ChartEarthly({
    required this.branches,
    required this.fiveElements,
  });

  final EarthlyBranches branches;
  final EarthlyFiveElements fiveElements;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChartEarthly &&
        other.branches == branches &&
        other.fiveElements == fiveElements;
  }

  @override
  int get hashCode => Object.hash(branches, fiveElements);
}
