part of './chart.dart';

/// Heavenly stems and five elements of a chart
class ChartHeavenly {
  /// Heavenly stems
  ChartHeavenly(this.stems, this.fiveElements);

  /// Create a [ChartHeavenly] from a JSON object
  factory ChartHeavenly.fromJson(Map<String, dynamic> json) {
    final stems = HeavenlyStems.fromJson(json['stems'] as Map<String, dynamic>);
    final fiveElements = HeavenlyFiveElements.fromJson(
      json['fiveElements'] as Map<String, dynamic>,
    );

    return ChartHeavenly(stems, fiveElements);
  }

  /// Heavenly stems
  final HeavenlyStems stems;

  /// Five elements of heavenly stems
  final HeavenlyFiveElements fiveElements;
}

/// [HeavenlyStems]l HeavenlyStems class
class HeavenlyStems {
  /// [HeavenlyStems] HeavenlyStems constructor
  HeavenlyStems({
    required this.year,
    required this.month,
    required this.day,
    this.hour,
  });

  /// [HeavenlyStems.fromJson] Create a [HeavenlyStems] from a JSON object
  factory HeavenlyStems.fromJson(Map<String, dynamic> json) {
    return HeavenlyStems(
      year: HeavenlyStem.fromString(json['year'] as String),
      month: HeavenlyStem.fromString(json['month'] as String),
      day: HeavenlyStem.fromString(json['day'] as String),
      hour: json['hour'] == null
          ? null
          : HeavenlyStem.fromString(json['hour'] as String),
    );
  }

  /// [year] HeavenlyStems year
  final HeavenlyStem year;

  /// [month] HeavenlyStems month
  final HeavenlyStem month;

  /// [day] HeavenlyStems day
  final HeavenlyStem day;

  /// [hour] HeavenlyStems hour
  final HeavenlyStem? hour;
}

/// [HeavenlyFiveElements] HeavenlyFiveElements class
class HeavenlyFiveElements {
  /// [HeavenlyFiveElements] HeavenlyFiveElements constructor
  HeavenlyFiveElements({
    required this.year,
    required this.month,
    required this.day,
    this.hour,
  });

  /// [HeavenlyFiveElements.fromJson] Create a [HeavenlyFiveElements]
  /// from a JSON object
  factory HeavenlyFiveElements.fromJson(Map<String, dynamic> json) {
    return HeavenlyFiveElements(
      year: FiveElement.fromString(json['year'] as String),
      month: FiveElement.fromString(json['month'] as String),
      day: FiveElement.fromString(json['day'] as String),
      hour: json['hour'] == null
          ? null
          : FiveElement.fromString(json['hour'] as String),
    );
  }

  /// [year] HeavenlyFiveElements year
  final FiveElement year;

  /// [month] HeavenlyFiveElements month
  final FiveElement month;

  /// [day] HeavenlyFiveElements day
  final FiveElement day;

  /// [hour] HeavenlyFiveElements hour
  final FiveElement? hour;
}
