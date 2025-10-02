import 'package:flutter/foundation.dart';
import 'package:traditional_saju/src/domain/saju/entity/chart.dart';
import 'package:traditional_saju/src/domain/saju/entity/yearly_fortune_description.dart';
import 'package:traditional_saju/src/domain/user/value/gender.dart';

/// Yearly fortune analysis entity
@immutable
class YearlyFortune {
  const YearlyFortune({
    required this.name,
    required this.birthDateTime,
    required this.gender,
    required this.chart,
    required this.description,
  });

  final String name;
  final DateTime birthDateTime;
  final Gender gender;
  final Chart chart;
  final YearlyFortuneDescription description;

  /// Copy this entity with updated fields
  YearlyFortune copyWith({
    String? name,
    DateTime? birthDateTime,
    Gender? gender,
    Chart? chart,
    YearlyFortuneDescription? description,
  }) {
    return YearlyFortune(
      name: name ?? this.name,
      birthDateTime: birthDateTime ?? this.birthDateTime,
      gender: gender ?? this.gender,
      chart: chart ?? this.chart,
      description: description ?? this.description,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is YearlyFortune &&
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
