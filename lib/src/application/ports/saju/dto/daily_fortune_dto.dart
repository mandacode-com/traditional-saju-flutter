import 'package:flutter/foundation.dart';
import 'package:traditional_saju/src/domain/saju/entity/daily_fortune.dart';
import 'package:traditional_saju/src/domain/user/value/gender.dart';

/// Data Transfer Object for Daily Fortune API responses
@immutable
class DailyFortuneDto {
  const DailyFortuneDto({
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
    this.questionAnswer,
  });

  factory DailyFortuneDto.fromDomain(DailyFortune fortune) {
    return DailyFortuneDto(
      name: fortune.name,
      birthDateTime: fortune.birthDateTime.toIso8601String(),
      gender: fortune.gender.name,
      todayShortMessage: fortune.todayShortMessage,
      fortuneScore: fortune.fortuneScore,
      totalFortuneMessage: fortune.totalFortuneMessage,
      relationship: fortune.relationship,
      wealth: fortune.wealth,
      romantic: fortune.romantic,
      health: fortune.health,
      caution: fortune.caution,
      questionAnswer: fortune.questionAnswer,
    );
  }

  factory DailyFortuneDto.fromJson(Map<String, dynamic> json) {
    return DailyFortuneDto(
      name: json['name'] as String,
      birthDateTime: json['birthDateTime'] as String,
      gender: json['gender'] as String,
      todayShortMessage: json['todayShortMessage'] as String,
      fortuneScore: json['fortuneScore'] as int,
      totalFortuneMessage: json['totalFortuneMessage'] as String,
      relationship: json['relationship'] as String,
      wealth: json['wealth'] as String,
      romantic: json['romantic'] as String,
      health: json['health'] as String,
      caution: json['caution'] as String,
      questionAnswer: json.containsKey('questionAnswer')
          ? json['questionAnswer'] as String?
          : null,
    );
  }

  final String name;
  final String birthDateTime;
  final String gender;
  final String todayShortMessage;
  final int fortuneScore;
  final String totalFortuneMessage;
  final String relationship;
  final String wealth;
  final String romantic;
  final String health;
  final String caution;
  final String? questionAnswer;

  DailyFortune toDomain() {
    return DailyFortune(
      name: name,
      birthDateTime: DateTime.parse(birthDateTime),
      gender: Gender.values.firstWhere((g) => g.name == gender),
      todayShortMessage: todayShortMessage,
      fortuneScore: fortuneScore,
      totalFortuneMessage: totalFortuneMessage,
      relationship: relationship,
      wealth: wealth,
      romantic: romantic,
      health: health,
      caution: caution,
      questionAnswer: questionAnswer,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'birthDateTime': birthDateTime,
      'gender': gender,
      'todayShortMessage': todayShortMessage,
      'fortuneScore': fortuneScore,
      'totalFortuneMessage': totalFortuneMessage,
      'relationship': relationship,
      'wealth': wealth,
      'romantic': romantic,
      'health': health,
      'caution': caution,
      if (questionAnswer != null) 'questionAnswer': questionAnswer,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DailyFortuneDto &&
        other.name == name &&
        other.birthDateTime == birthDateTime &&
        other.gender == gender &&
        other.todayShortMessage == todayShortMessage &&
        other.fortuneScore == fortuneScore &&
        other.totalFortuneMessage == totalFortuneMessage &&
        other.relationship == relationship &&
        other.wealth == wealth &&
        other.romantic == romantic &&
        other.health == health &&
        other.caution == caution &&
        other.questionAnswer == questionAnswer;
  }

  @override
  int get hashCode {
    return Object.hash(
      name,
      birthDateTime,
      gender,
      todayShortMessage,
      fortuneScore,
      totalFortuneMessage,
      relationship,
      wealth,
      romantic,
      health,
      caution,
      questionAnswer,
    );
  }
}
