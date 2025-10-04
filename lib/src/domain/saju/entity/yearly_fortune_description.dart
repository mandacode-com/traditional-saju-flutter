import 'package:flutter/foundation.dart';

/// Yearly fortune description entity
@immutable
class YearlyFortuneDescription {
  const YearlyFortuneDescription({
    required this.general,
    required this.relationship,
    required this.wealth,
    required this.romantic,
    required this.health,
    required this.career,
    required this.waysToImprove,
    required this.caution,
    this.questionAnswer,
  });

  final String general;
  final String relationship;
  final String wealth;
  final String romantic;
  final String health;
  final String career;
  final String waysToImprove;
  final String caution;
  final String? questionAnswer;

  /// Copy this entity with updated fields
  YearlyFortuneDescription copyWith({
    String? general,
    String? relationship,
    String? wealth,
    String? romantic,
    String? health,
    String? career,
    String? waysToImprove,
    String? caution,
    String? questionAnswer,
  }) {
    return YearlyFortuneDescription(
      general: general ?? this.general,
      relationship: relationship ?? this.relationship,
      wealth: wealth ?? this.wealth,
      romantic: romantic ?? this.romantic,
      health: health ?? this.health,
      career: career ?? this.career,
      waysToImprove: waysToImprove ?? this.waysToImprove,
      caution: caution ?? this.caution,
      questionAnswer: questionAnswer ?? this.questionAnswer,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is YearlyFortuneDescription &&
        other.general == general &&
        other.relationship == relationship &&
        other.wealth == wealth &&
        other.romantic == romantic &&
        other.health == health &&
        other.career == career &&
        other.waysToImprove == waysToImprove &&
        other.caution == caution &&
        other.questionAnswer == questionAnswer;
  }

  @override
  int get hashCode {
    return Object.hash(
      general,
      relationship,
      wealth,
      romantic,
      health,
      career,
      waysToImprove,
      caution,
      questionAnswer,
    );
  }
}
