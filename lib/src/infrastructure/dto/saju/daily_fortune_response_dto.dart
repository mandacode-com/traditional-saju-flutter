import 'package:traditional_saju/src/domain/saju/entity/daily_fortune.dart';
import 'package:traditional_saju/src/domain/user/value/gender.dart';

/// DTO for daily fortune response from API
class DailyFortuneResponseDto {
  const DailyFortuneResponseDto({
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

  factory DailyFortuneResponseDto.fromJson(Map<String, dynamic> json) {
    return DailyFortuneResponseDto(
      name: json['name'] as String? ?? '',
      birthDateTime: json['birthDateTime'] != null
          ? DateTime.parse(json['birthDateTime'] as String)
          : DateTime.now(),
      gender: _parseGender(json['gender'] as String?),
      todayShortMessage: json['todayShortMessage'] as String? ?? '',
      fortuneScore: (json['fortuneScore'] as num?)?.toInt() ?? 0,
      totalFortuneMessage: json['totalFortuneMessage'] as String? ?? '',
      relationship: json['relationship'] as String? ?? '',
      wealth: json['wealth'] as String? ?? '',
      romantic: json['romantic'] as String? ?? '',
      health: json['health'] as String? ?? '',
      caution: json['caution'] as String? ?? '',
      questionAnswer: json['questionAnswer'] as String?,
    );
  }

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

  static Gender _parseGender(String? genderStr) {
    switch (genderStr?.toLowerCase()) {
      case 'male':
        return Gender.male;
      case 'female':
        return Gender.female;
      default:
        return Gender.male;
    }
  }

  /// Convert DTO to Domain Entity
  DailyFortune toDomain() {
    return DailyFortune(
      name: name,
      birthDateTime: birthDateTime,
      gender: gender,
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
}
