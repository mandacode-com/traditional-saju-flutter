import 'package:flutter/foundation.dart';
import 'package:traditional_saju_v1/src/domain/saju/value/heavenly_five_elements.dart';
import 'package:traditional_saju_v1/src/domain/saju/value/heavenly_stems.dart';

@immutable
class ChartHeavenly {
  const ChartHeavenly({
    required this.stems,
    required this.fiveElements,
  });

  final HeavenlyStems stems;
  final HeavenlyFiveElements fiveElements;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChartHeavenly &&
        other.stems == stems &&
        other.fiveElements == fiveElements;
  }

  @override
  int get hashCode => Object.hash(stems, fiveElements);
}
