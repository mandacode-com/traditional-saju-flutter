import 'package:models/models.dart';

class DailySajuResonse {
  DailySajuResonse({
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
    required this.waysToAvoidBadLuck,
  });

  final String name;
  final DateTime birthDateTime;
  final Gender gender;
  final String todayShortMessage;
  final num fortuneScore;
  final String totalFortuneMessage;
  final String relationship;
  final String wealth;
  final String romantic;
  final String health;
  final String waysToAvoidBadLuck;

  factory DailySajuResonse.fromJson(Map<String, dynamic> json) {
    return DailySajuResonse(
      name: json['name'] as String,
      birthDateTime: DateTime.parse(json['birthDateTime'] as String),
      gender: Gender.values.firstWhere(
        (element) => element.toString().split('.').last == json['gender'],
      ),
      todayShortMessage: json['todayShortMessage'] as String,
      fortuneScore: json['fortuneScore'] as num,
      totalFortuneMessage: json['totalFortuneMessage'] as String,
      relationship: json['relationship'] as String,
      wealth: json['wealth'] as String,
      romantic: json['romantic'] as String,
      health: json['health'] as String,
      waysToAvoidBadLuck: json['waysToAvoidBadLuck'] as String,
    );
  }
}
