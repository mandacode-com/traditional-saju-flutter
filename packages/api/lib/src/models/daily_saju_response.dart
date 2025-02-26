import 'package:models/models.dart';

class DailySajuResponse {
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

  final String name;
  final DateTime birthDateTime;
  final Gender gender;
  final String todayShortMessage;
  final int fortuneScore;
  final String totalFortuneMessage;
  final String relationship;
  final String wealth;
  final String romantic;
  final String health;
  final String caution;
  final String? questionAnswer;

  factory DailySajuResponse.fromJson(Map<String, dynamic> json) {
    return DailySajuResponse(
      name: json['name'] as String,
      birthDateTime: DateTime.parse(json['birthDateTime'] as String),
      gender: Gender.values.firstWhere(
        (element) => element.toString().split('.').last == json['gender'],
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
}
