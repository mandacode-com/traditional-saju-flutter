part of './chart.dart';

/// Heavenly stems and five elements of a chart
class ChartHeavenly {
  /// Heavenly stems
  ChartHeavenly(this.stems, this.fiveElements);

  /// Create a [ChartHeavenly] from a JSON object
  factory ChartHeavenly.fromJson(Map<String, dynamic> json) {
    final stems = HeavenlyStems.fromJson(json['stems'] as Map<String, dynamic>);
    final fiveElements = HeavenlyFiveElements.fromJson(
        json['fiveElements'] as Map<String, dynamic>);

    return ChartHeavenly(stems, fiveElements);
  }

  /// Heavenly stems
  final HeavenlyStems stems;

  /// Five elements of heavenly stems
  final HeavenlyFiveElements fiveElements;
}

class HeavenlyStems {
  final HeavenlyStem year;
  final HeavenlyStem month;
  final HeavenlyStem day;
  final HeavenlyStem? hour;

  HeavenlyStems({
    required this.year,
    required this.month,
    required this.day,
    this.hour,
  });

  factory HeavenlyStems.fromJson(Map<String, dynamic> json) {
    return HeavenlyStems(
      year: HeavenlyStem.values.firstWhere(
        (element) => element.toString().split('.').last == json['year'],
      ),
      month: HeavenlyStem.values.firstWhere(
        (element) => element.toString().split('.').last == json['month'],
      ),
      day: HeavenlyStem.values.firstWhere(
        (element) => element.toString().split('.').last == json['day'],
      ),
      hour: json.containsKey('hour')
          ? HeavenlyStem.values.firstWhere(
              (element) => element.toString().split('.').last == json['hour'],
            )
          : null,
    );
  }
}

class HeavenlyFiveElements {
  final FiveElement year;
  final FiveElement month;
  final FiveElement day;
  final FiveElement? hour;

  HeavenlyFiveElements({
    required this.year,
    required this.month,
    required this.day,
    this.hour,
  });

  factory HeavenlyFiveElements.fromJson(Map<String, dynamic> json) {
    return HeavenlyFiveElements(
      year: FiveElement.values.firstWhere(
        (element) => element.toString().split('.').last == json['year'],
      ),
      month: FiveElement.values.firstWhere(
        (element) => element.toString().split('.').last == json['month'],
      ),
      day: FiveElement.values.firstWhere(
        (element) => element.toString().split('.').last == json['day'],
      ),
      hour: json['hour'] == null
          ? null
          : FiveElement.values.firstWhere(
              (element) => element.toString().split('.').last == json['hour'],
            ),
    );
  }
}
