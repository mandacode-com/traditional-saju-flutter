part of 'yearly_saju.dart';

/// {@template yearly_saju_result}
/// Yearly Saju result
/// {@endtemplate}
class YearlySajuResult {
  /// {@macro yearly_saju_result}
  YearlySajuResult({
    required this.name,
    required this.birthDateTime,
    required this.gender,
    required this.chart,
    required this.description,
  });

  /// Yearly Saju result from JSON
  factory YearlySajuResult.fromJson(Map<String, dynamic> json) {
    final chart = Chart.fromJson(json['chart'] as Map<String, dynamic>);
    final description = YearlySajuDescription.fromJson(
      json['description'] as Map<String, dynamic>,
    );
    return YearlySajuResult(
      name: json['name'] as String,
      birthDateTime: DateTime.parse(json['birthDateTime'] as String),
      gender: ApiGenderType.values.firstWhere(
          (element) => element.toString().split('.').last == json['gender']),
      chart: chart,
      description: description,
    );
  }

  /// Name
  final String name;

  /// Birth date time
  final DateTime birthDateTime;

  /// Gender
  final ApiGenderType gender;

  /// Chart
  final Chart chart;

  /// Description
  final YearlySajuDescription description;
}

/// Yearly Saju description
class YearlySajuDescription {
  /// Yearly Saju description
  YearlySajuDescription({
    required this.general,
    required this.relationship,
    required this.wealth,
    required this.romantic,
    required this.health,
    required this.career,
    required this.waysToImprove,
    required this.waysToAvoidBadLuck,
  });

  /// Yearly Saju description from JSON
  factory YearlySajuDescription.fromJson(Map<String, dynamic> json) {
    return YearlySajuDescription(
      general: json['general'] as String,
      relationship: json['relationship'] as String,
      wealth: json['wealth'] as String,
      romantic: json['romantic'] as String,
      health: json['health'] as String,
      career: json['career'] as String,
      waysToImprove: json['waysToImprove'] as String,
      waysToAvoidBadLuck: json['waysToAvoidBadLuck'] as String,
    );
  }

  /// General
  final String general;

  /// Relationship
  final String relationship;

  /// Wealth
  final String wealth;

  /// Romantic
  final String romantic;

  /// Health
  final String health;

  /// Career
  final String career;

  /// Ways to improve
  final String waysToImprove;

  /// Ways to avoid bad luck
  final String waysToAvoidBadLuck;
}
