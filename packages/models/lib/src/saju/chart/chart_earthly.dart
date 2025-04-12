part of './chart.dart';

/// Earthly branch
class ChartEarthly {
  /// Earthly branch
  ChartEarthly({
    required this.branches,
    required this.fiveElements,
  });

  /// Create a [ChartEarthly] from a JSON object
  factory ChartEarthly.fromJson(Map<String, dynamic> json) {
    final branches =
        EarthlyBranches.fromJson(json['branches'] as Map<String, dynamic>);
    final fiveElements = EarthlyFiveElements.fromJson(
      json['fiveElements'] as Map<String, dynamic>,
    );

    return ChartEarthly(
      branches: branches,
      fiveElements: fiveElements,
    );
  }

  /// Earthly branches
  final EarthlyBranches branches;

  /// Five elements of earthly branches
  final EarthlyFiveElements fiveElements;
}

/// Earthly branches
class EarthlyBranches {
  /// Earthly branches
  EarthlyBranches({
    required this.year,
    required this.month,
    required this.day,
    this.hour,
  });

  /// [EarthlyBranches.fromJson] Create a [EarthlyBranches] from a JSON object
  factory EarthlyBranches.fromJson(Map<String, dynamic> json) {
    return EarthlyBranches(
      year: EarthlyBranch.fromString(json['year'] as String),
      month: EarthlyBranch.fromString(json['month'] as String),
      day: EarthlyBranch.fromString(json['day'] as String),
      hour: json['hour'] == null
          ? null
          : EarthlyBranch.fromString(json['hour'] as String),
    );
  }

  /// [year] Earthly branch year
  final EarthlyBranch year;

  /// [month] Earthly branch month
  final EarthlyBranch month;

  /// [day] Earthly branch day
  final EarthlyBranch day;

  /// [hour] Earthly branch hour
  final EarthlyBranch? hour;
}

/// [EarthlyFiveElements] Earthly five elements
class EarthlyFiveElements {
  /// [EarthlyFiveElements] Earthly five elements constructor
  EarthlyFiveElements({
    required this.year,
    required this.month,
    required this.day,
    this.hour,
  });

  /// [EarthlyFiveElements.fromJson] Create a [EarthlyFiveElements] from a JSON
  factory EarthlyFiveElements.fromJson(Map<String, dynamic> json) {
    return EarthlyFiveElements(
      year: FiveElement.fromString(json['year'] as String),
      month: FiveElement.fromString(json['month'] as String),
      day: FiveElement.fromString(json['day'] as String),
      hour: json['hour'] == null
          ? null
          : FiveElement.fromString(json['hour'] as String),
    );
  }

  /// [year] Earthly five elements year
  final FiveElement year;

  /// [month] Earthly five elements month
  final FiveElement month;

  /// [day] Earthly five elements day
  final FiveElement day;

  /// [hour] Earthly five elements hour
  final FiveElement? hour;
}
