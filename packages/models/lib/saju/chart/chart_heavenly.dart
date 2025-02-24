part of './chart.dart';

/// Heavenly stems and five elements of a chart
class ChartHeavenly {
  /// Heavenly stems
  ChartHeavenly(this.stems, this.fiveElements);

  /// Create a [ChartHeavenly] from a JSON object
  factory ChartHeavenly.fromJson(Map<String, dynamic> json) {
    final stems = (json['stems'] as List<dynamic>)
        .map(
          (e) => HeavenlyStem.values.firstWhere(
            (element) => element.toString().split('.').last == e,
          ),
        )
        .toList();
    final fiveElements = (json['fiveElements'] as List<dynamic>)
        .map(
          (e) => FiveElement.values.firstWhere(
            (element) => element.toString().split('.').last == e,
          ),
        )
        .toList();

    return ChartHeavenly(stems, fiveElements);
  }

  /// Heavenly stems
  final List<HeavenlyStem> stems;

  /// Five elements of heavenly stems
  final List<FiveElement> fiveElements;
}
