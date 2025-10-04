import 'package:flutter/foundation.dart';
import 'package:traditional_saju/src/domain/saju/entity/chart_earthly.dart';
import 'package:traditional_saju/src/domain/saju/entity/chart_heavenly.dart';

@immutable
class Chart {
  const Chart({
    required this.heavenly,
    required this.earthly,
  });

  final ChartHeavenly heavenly;
  final ChartEarthly earthly;

  bool get isComplete =>
      heavenly.stems.hasHour &&
      heavenly.fiveElements.hasHour &&
      earthly.branches.hasHour &&
      earthly.fiveElements.hasHour;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Chart &&
        other.heavenly == heavenly &&
        other.earthly == earthly;
  }

  @override
  int get hashCode => Object.hash(heavenly, earthly);
}
