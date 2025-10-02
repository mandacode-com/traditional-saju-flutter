import 'package:traditional_saju/src/application/ports/saju/dto/chart_dto.dart';
import 'package:traditional_saju/src/domain/saju/entity/yearly_fortune.dart';
import 'package:traditional_saju/src/domain/saju/entity/yearly_fortune_description.dart';
import 'package:traditional_saju/src/domain/user/value/gender.dart';

/// DTO for yearly fortune response from API
class YearlyFortuneResponseDto {
  const YearlyFortuneResponseDto({
    required this.name,
    required this.birthDateTime,
    required this.gender,
    required this.chart,
    required this.description,
  });

  factory YearlyFortuneResponseDto.fromJson(Map<String, dynamic> json) {
    return YearlyFortuneResponseDto(
      name: json['name'] as String? ?? '',
      birthDateTime: json['birthDateTime'] != null
          ? DateTime.parse(json['birthDateTime'] as String)
          : DateTime.now(),
      gender: _parseGender(json['gender'] as String?),
      chart: ChartDto.fromJson(json['chart'] as Map<String, dynamic>? ?? {}),
      description: _parseDescription(
        json['description'] as Map<String, dynamic>? ?? {},
      ),
    );
  }

  final String name;
  final DateTime birthDateTime;
  final Gender gender;
  final ChartDto chart;
  final YearlyFortuneDescriptionDto description;

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

  static YearlyFortuneDescriptionDto _parseDescription(
    Map<String, dynamic> json,
  ) {
    return YearlyFortuneDescriptionDto(
      general: json['general'] as String? ?? '',
      relationship: json['relationship'] as String? ?? '',
      wealth: json['wealth'] as String? ?? '',
      romantic: json['romantic'] as String? ?? '',
      health: json['health'] as String? ?? '',
      career: json['career'] as String? ?? '',
      waysToImprove: json['waysToImprove'] as String? ?? '',
      caution: json['caution'] as String? ?? '',
      questionAnswer: json['questionAnswer'] as String?,
    );
  }

  /// Convert DTO to Domain Entity
  YearlyFortune toDomain() {
    return YearlyFortune(
      name: name,
      birthDateTime: birthDateTime,
      gender: gender,
      chart: chart.toDomain(),
      description: description.toDomain(),
    );
  }
}

/// DTO for yearly fortune description
class YearlyFortuneDescriptionDto {
  const YearlyFortuneDescriptionDto({
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

  /// Convert DTO to Domain Entity
  YearlyFortuneDescription toDomain() {
    return YearlyFortuneDescription(
      general: general,
      relationship: relationship,
      wealth: wealth,
      romantic: romantic,
      health: health,
      career: career,
      waysToImprove: waysToImprove,
      caution: caution,
      questionAnswer: questionAnswer,
    );
  }
}
