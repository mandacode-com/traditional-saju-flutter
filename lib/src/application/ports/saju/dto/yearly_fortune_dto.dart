import 'package:flutter/foundation.dart';
import 'package:traditional_saju/src/domain/saju/entity/yearly_fortune.dart';
import 'package:traditional_saju/src/domain/saju/entity/yearly_fortune_description.dart';
import 'package:traditional_saju/src/domain/user/value/gender.dart';
import 'package:traditional_saju/src/application/ports/saju/dto/chart_dto.dart';

/// Data Transfer Object for Yearly Fortune Description
@immutable
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

  factory YearlyFortuneDescriptionDto.fromDomain(
    YearlyFortuneDescription description,
  ) {
    return YearlyFortuneDescriptionDto(
      general: description.general,
      relationship: description.relationship,
      wealth: description.wealth,
      romantic: description.romantic,
      health: description.health,
      career: description.career,
      waysToImprove: description.waysToImprove,
      caution: description.caution,
      questionAnswer: description.questionAnswer,
    );
  }

  factory YearlyFortuneDescriptionDto.fromJson(Map<String, dynamic> json) {
    return YearlyFortuneDescriptionDto(
      general: json['general'] as String,
      relationship: json['relationship'] as String,
      wealth: json['wealth'] as String,
      romantic: json['romantic'] as String,
      health: json['health'] as String,
      career: json['career'] as String,
      waysToImprove: json['waysToImprove'] as String,
      caution: json['caution'] as String,
      questionAnswer: json.containsKey('questionAnswer')
          ? json['questionAnswer'] as String?
          : null,
    );
  }

  final String general;
  final String relationship;
  final String wealth;
  final String romantic;
  final String health;
  final String career;
  final String waysToImprove;
  final String caution;
  final String? questionAnswer;

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

  Map<String, dynamic> toJson() {
    return {
      'general': general,
      'relationship': relationship,
      'wealth': wealth,
      'romantic': romantic,
      'health': health,
      'career': career,
      'waysToImprove': waysToImprove,
      'caution': caution,
      if (questionAnswer != null) 'questionAnswer': questionAnswer,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is YearlyFortuneDescriptionDto &&
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

/// Data Transfer Object for Yearly Fortune API responses
@immutable
class YearlyFortuneDto {
  const YearlyFortuneDto({
    required this.name,
    required this.birthDateTime,
    required this.gender,
    required this.chart,
    required this.description,
  });

  factory YearlyFortuneDto.fromDomain(YearlyFortune fortune) {
    return YearlyFortuneDto(
      name: fortune.name,
      birthDateTime: fortune.birthDateTime.toIso8601String(),
      gender: fortune.gender.name,
      chart: ChartDto.fromDomain(fortune.chart),
      description: YearlyFortuneDescriptionDto.fromDomain(fortune.description),
    );
  }

  factory YearlyFortuneDto.fromJson(Map<String, dynamic> json) {
    return YearlyFortuneDto(
      name: json['name'] as String,
      birthDateTime: json['birthDateTime'] as String,
      gender: json['gender'] as String,
      chart: ChartDto.fromJson(json['chart'] as Map<String, dynamic>),
      description: YearlyFortuneDescriptionDto.fromJson(
        json['description'] as Map<String, dynamic>,
      ),
    );
  }

  final String name;
  final String birthDateTime;
  final String gender;
  final ChartDto chart;
  final YearlyFortuneDescriptionDto description;

  YearlyFortune toDomain() {
    return YearlyFortune(
      name: name,
      birthDateTime: DateTime.parse(birthDateTime),
      gender: Gender.values.firstWhere((g) => g.name == gender),
      chart: chart.toDomain(),
      description: description.toDomain(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'birthDateTime': birthDateTime,
      'gender': gender,
      'chart': chart.toJson(),
      'description': description.toJson(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is YearlyFortuneDto &&
        other.name == name &&
        other.birthDateTime == birthDateTime &&
        other.gender == gender &&
        other.chart == chart &&
        other.description == description;
  }

  @override
  int get hashCode {
    return Object.hash(
      name,
      birthDateTime,
      gender,
      chart,
      description,
    );
  }
}