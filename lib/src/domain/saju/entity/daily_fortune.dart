import 'package:flutter/foundation.dart';
import 'package:traditional_saju/src/domain/user/value/gender.dart';

/// Daily fortune analysis entity
@immutable
class DailyFortune {
  const DailyFortune({
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

  /// Copy this entity with updated fields
  DailyFortune copyWith({
    String? name,
    DateTime? birthDateTime,
    Gender? gender,
    String? todayShortMessage,
    int? fortuneScore,
    String? totalFortuneMessage,
    String? relationship,
    String? wealth,
    String? romantic,
    String? health,
    String? caution,
    String? questionAnswer,
  }) {
    return DailyFortune(
      name: name ?? this.name,
      birthDateTime: birthDateTime ?? this.birthDateTime,
      gender: gender ?? this.gender,
      todayShortMessage: todayShortMessage ?? this.todayShortMessage,
      fortuneScore: fortuneScore ?? this.fortuneScore,
      totalFortuneMessage: totalFortuneMessage ?? this.totalFortuneMessage,
      relationship: relationship ?? this.relationship,
      wealth: wealth ?? this.wealth,
      romantic: romantic ?? this.romantic,
      health: health ?? this.health,
      caution: caution ?? this.caution,
      questionAnswer: questionAnswer ?? this.questionAnswer,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DailyFortune &&
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
