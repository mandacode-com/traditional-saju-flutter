import 'package:models/models.dart';

/// [DailySajuResponse] Daily Saju response model
class DailySajuResponse {
  /// [DailySajuResponse] constructor
  DailySajuResponse({
    required this.name,
    required this.birthDateTime,
    required this.gender,
    required this.todayShortMessage,
    required this.fortuneScore,
    required this.totalFortuneMessage,
    required this.relationship,
    required this.wealth,
    required this.romantic,
    required this.health,
    required this.caution,
    required this.questionAnswer,
  });

  /// [DailySajuResponse.fromJson] Daily Saju result from JSON
  factory DailySajuResponse.fromJson(Map<String, dynamic> json) {
    return DailySajuResponse(
      name: json['name'] as String,
      birthDateTime: DateTime.parse(json['birthDateTime'] as String),
      gender: Gender.values.firstWhere(
        (element) => element.toString() == json['gender'],
      ),
      todayShortMessage: json['todayShortMessage'] as String,
      fortuneScore: json['fortuneScore'] as int,
      totalFortuneMessage: json['totalFortuneMessage'] as String,
      relationship: json['relationship'] as String,
      wealth: json['wealth'] as String,
      romantic: json['romantic'] as String,
      health: json['health'] as String,
      caution: json['caution'] as String,
      questionAnswer: json.containsKey('questionAnswer')
          ? json['questionAnswer'] as String
          : null,
    );
  }

  /// [name]
  final String name;

  /// [birthDateTime]
  final DateTime birthDateTime;

  /// [gender]
  final Gender gender;

  /// [todayShortMessage]
  final String todayShortMessage;

  /// [fortuneScore]
  final int fortuneScore;

  /// [totalFortuneMessage]
  final String totalFortuneMessage;

  /// [relationship]
  final String relationship;

  /// [wealth]
  final String wealth;

  /// [romantic]
  final String romantic;

  /// [health]
  final String health;

  /// [caution]
  final String caution;

  /// [questionAnswer]
  final String? questionAnswer;
}
