import 'package:flutter/foundation.dart';
import 'package:traditional_saju/src/domain/saju/entity/birth_date.dart';
import 'package:traditional_saju/src/domain/saju/entity/birth_hour.dart';
import 'package:traditional_saju/src/domain/saju/entity/birth_minutes.dart';

/// Data Transfer Object for Saju request with birth information
@immutable
class SajuRequestDto {
  const SajuRequestDto({
    required this.birthDate,
    this.birthHour,
    this.birthMinutes,
  });

  factory SajuRequestDto.fromBirthInfo({
    required BirthDate birthDate,
    BirthHour? birthHour,
    BirthMinutes? birthMinutes,
  }) {
    return SajuRequestDto(
      birthDate: birthDate.value.toIso8601String(),
      birthHour: birthHour?.value,
      birthMinutes: birthMinutes?.value,
    );
  }

  final String birthDate;
  final int? birthHour;
  final int? birthMinutes;

  Map<String, dynamic> toJson() {
    return {
      'birth_date': birthDate,
      if (birthHour != null) 'birth_hour': birthHour,
      if (birthMinutes != null) 'birth_minutes': birthMinutes,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SajuRequestDto &&
        other.birthDate == birthDate &&
        other.birthHour == birthHour &&
        other.birthMinutes == birthMinutes;
  }

  @override
  int get hashCode => Object.hash(birthDate, birthHour, birthMinutes);
}