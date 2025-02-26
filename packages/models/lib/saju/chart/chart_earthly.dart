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
        json['fiveElements'] as Map<String, dynamic>);

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

class EarthlyBranches {
  EarthlyBranches({
    required this.year,
    required this.month,
    required this.day,
    this.hour,
  });

  final EarthlyBranch year;
  final EarthlyBranch month;
  final EarthlyBranch day;
  final EarthlyBranch? hour;

  factory EarthlyBranches.fromJson(Map<String, dynamic> json) {
    return EarthlyBranches(
      year: EarthlyBranch.values.firstWhere(
        (element) => element.toString().split('.').last == json['year'],
      ),
      month: EarthlyBranch.values.firstWhere(
        (element) => element.toString().split('.').last == json['month'],
      ),
      day: EarthlyBranch.values.firstWhere(
        (element) => element.toString().split('.').last == json['day'],
      ),
      hour: json.containsKey('hour')
          ? EarthlyBranch.values.firstWhere(
              (element) => element.toString().split('.').last == json['hour'],
            )
          : null,
    );
  }
}

class EarthlyFiveElements {
  EarthlyFiveElements({
    required this.year,
    required this.month,
    required this.day,
    this.hour,
  });

  final FiveElement year;
  final FiveElement month;
  final FiveElement day;
  final FiveElement? hour;

  factory EarthlyFiveElements.fromJson(Map<String, dynamic> json) {
    return EarthlyFiveElements(
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
