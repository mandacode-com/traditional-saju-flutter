import 'package:flutter/foundation.dart';
import 'package:traditional_saju/src/domain/saju/entity/chart.dart';
import 'package:traditional_saju/src/domain/saju/entity/chart_earthly.dart';
import 'package:traditional_saju/src/domain/saju/entity/chart_heavenly.dart';
import 'package:traditional_saju/src/domain/saju/value/earthly_branch.dart';
import 'package:traditional_saju/src/domain/saju/value/earthly_branches.dart';
import 'package:traditional_saju/src/domain/saju/value/earthly_five_elements.dart';
import 'package:traditional_saju/src/domain/saju/value/five_element.dart';
import 'package:traditional_saju/src/domain/saju/value/heavenly_five_elements.dart';
import 'package:traditional_saju/src/domain/saju/value/heavenly_stem.dart';
import 'package:traditional_saju/src/domain/saju/value/heavenly_stems.dart';

/// Data Transfer Object for Saju Chart API responses
@immutable
class ChartDto {
  const ChartDto({
    required this.heavenly,
    required this.earthly,
  });

  factory ChartDto.fromDomain(Chart chart) {
    return ChartDto(
      heavenly: ChartHeavenlyDto.fromDomain(chart.heavenly),
      earthly: ChartEarthlyDto.fromDomain(chart.earthly),
    );
  }

  factory ChartDto.fromJson(Map<String, dynamic> json) {
    return ChartDto(
      heavenly: ChartHeavenlyDto.fromJson(
        json['heavenly'] as Map<String, dynamic>,
      ),
      earthly: ChartEarthlyDto.fromJson(json['earthly'] as Map<String, dynamic>),
    );
  }

  final ChartHeavenlyDto heavenly;
  final ChartEarthlyDto earthly;

  Chart toDomain() {
    return Chart(
      heavenly: heavenly.toDomain(),
      earthly: earthly.toDomain(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'heavenly': heavenly.toJson(),
      'earthly': earthly.toJson(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChartDto &&
        other.heavenly == heavenly &&
        other.earthly == earthly;
  }

  @override
  int get hashCode => Object.hash(heavenly, earthly);
}

/// Data Transfer Object for Heavenly part of Saju Chart
@immutable
class ChartHeavenlyDto {
  const ChartHeavenlyDto({
    required this.stems,
    required this.fiveElements,
  });

  factory ChartHeavenlyDto.fromDomain(ChartHeavenly heavenly) {
    return ChartHeavenlyDto(
      stems: HeavenlyStemsDto.fromDomain(heavenly.stems),
      fiveElements: HeavenlyFiveElementsDto.fromDomain(
        heavenly.fiveElements,
      ),
    );
  }

  factory ChartHeavenlyDto.fromJson(Map<String, dynamic> json) {
    return ChartHeavenlyDto(
      stems: HeavenlyStemsDto.fromJson(
        json['stems'] as Map<String, dynamic>,
      ),
      fiveElements: HeavenlyFiveElementsDto.fromJson(
        json['five_elements'] as Map<String, dynamic>,
      ),
    );
  }

  final HeavenlyStemsDto stems;
  final HeavenlyFiveElementsDto fiveElements;

  ChartHeavenly toDomain() {
    return ChartHeavenly(
      stems: stems.toDomain(),
      fiveElements: fiveElements.toDomain(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stems': stems.toJson(),
      'five_elements': fiveElements.toJson(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChartHeavenlyDto &&
        other.stems == stems &&
        other.fiveElements == fiveElements;
  }

  @override
  int get hashCode => Object.hash(stems, fiveElements);
}

/// Data Transfer Object for Earthly part of Saju Chart
@immutable
class ChartEarthlyDto {
  const ChartEarthlyDto({
    required this.branches,
    required this.fiveElements,
  });

  factory ChartEarthlyDto.fromDomain(ChartEarthly earthly) {
    return ChartEarthlyDto(
      branches: EarthlyBranchesDto.fromDomain(earthly.branches),
      fiveElements: EarthlyFiveElementsDto.fromDomain(earthly.fiveElements),
    );
  }

  factory ChartEarthlyDto.fromJson(Map<String, dynamic> json) {
    return ChartEarthlyDto(
      branches: EarthlyBranchesDto.fromJson(
        json['branches'] as Map<String, dynamic>,
      ),
      fiveElements: EarthlyFiveElementsDto.fromJson(
        json['five_elements'] as Map<String, dynamic>,
      ),
    );
  }

  final EarthlyBranchesDto branches;
  final EarthlyFiveElementsDto fiveElements;

  ChartEarthly toDomain() {
    return ChartEarthly(
      branches: branches.toDomain(),
      fiveElements: fiveElements.toDomain(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'branches': branches.toJson(),
      'five_elements': fiveElements.toJson(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChartEarthlyDto &&
        other.branches == branches &&
        other.fiveElements == fiveElements;
  }

  @override
  int get hashCode => Object.hash(branches, fiveElements);
}

/// Data Transfer Object for Heavenly Stems
@immutable
class HeavenlyStemsDto {
  const HeavenlyStemsDto({
    required this.year,
    required this.month,
    required this.day,
    this.hour,
  });

  factory HeavenlyStemsDto.fromDomain(HeavenlyStems stems) {
    return HeavenlyStemsDto(
      year: stems.year.name,
      month: stems.month.name,
      day: stems.day.name,
      hour: stems.hour?.name,
    );
  }

  factory HeavenlyStemsDto.fromJson(Map<String, dynamic> json) {
    return HeavenlyStemsDto(
      year: json['year'] as String,
      month: json['month'] as String,
      day: json['day'] as String,
      hour: json['hour'] as String?,
    );
  }

  final String year;
  final String month;
  final String day;
  final String? hour;

  HeavenlyStems toDomain() {
    return HeavenlyStems(
      year: HeavenlyStem.values.firstWhere((s) => s.name == year),
      month: HeavenlyStem.values.firstWhere((s) => s.name == month),
      day: HeavenlyStem.values.firstWhere((s) => s.name == day),
      hour: hour != null
          ? HeavenlyStem.values.firstWhere((s) => s.name == hour)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'month': month,
      'day': day,
      if (hour != null) 'hour': hour,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HeavenlyStemsDto &&
        other.year == year &&
        other.month == month &&
        other.day == day &&
        other.hour == hour;
  }

  @override
  int get hashCode => Object.hash(year, month, day, hour);
}

/// Data Transfer Object for Earthly Branches
@immutable
class EarthlyBranchesDto {
  const EarthlyBranchesDto({
    required this.year,
    required this.month,
    required this.day,
    this.hour,
  });

  factory EarthlyBranchesDto.fromDomain(EarthlyBranches branches) {
    return EarthlyBranchesDto(
      year: branches.year.name,
      month: branches.month.name,
      day: branches.day.name,
      hour: branches.hour?.name,
    );
  }

  factory EarthlyBranchesDto.fromJson(Map<String, dynamic> json) {
    return EarthlyBranchesDto(
      year: json['year'] as String,
      month: json['month'] as String,
      day: json['day'] as String,
      hour: json['hour'] as String?,
    );
  }

  final String year;
  final String month;
  final String day;
  final String? hour;

  EarthlyBranches toDomain() {
    return EarthlyBranches(
      year: EarthlyBranch.values.firstWhere((b) => b.name == year),
      month: EarthlyBranch.values.firstWhere((b) => b.name == month),
      day: EarthlyBranch.values.firstWhere((b) => b.name == day),
      hour: hour != null
          ? EarthlyBranch.values.firstWhere((b) => b.name == hour)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'month': month,
      'day': day,
      if (hour != null) 'hour': hour,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EarthlyBranchesDto &&
        other.year == year &&
        other.month == month &&
        other.day == day &&
        other.hour == hour;
  }

  @override
  int get hashCode => Object.hash(year, month, day, hour);
}

/// Data Transfer Object for Heavenly Five Elements
@immutable
class HeavenlyFiveElementsDto {
  const HeavenlyFiveElementsDto({
    required this.year,
    required this.month,
    required this.day,
    this.hour,
  });

  factory HeavenlyFiveElementsDto.fromDomain(
    HeavenlyFiveElements elements,
  ) {
    return HeavenlyFiveElementsDto(
      year: elements.year.name,
      month: elements.month.name,
      day: elements.day.name,
      hour: elements.hour?.name,
    );
  }

  factory HeavenlyFiveElementsDto.fromJson(Map<String, dynamic> json) {
    return HeavenlyFiveElementsDto(
      year: json['year'] as String,
      month: json['month'] as String,
      day: json['day'] as String,
      hour: json['hour'] as String?,
    );
  }

  final String year;
  final String month;
  final String day;
  final String? hour;

  HeavenlyFiveElements toDomain() {
    return HeavenlyFiveElements(
      year: FiveElement.values.firstWhere((e) => e.name == year),
      month: FiveElement.values.firstWhere((e) => e.name == month),
      day: FiveElement.values.firstWhere((e) => e.name == day),
      hour: hour != null
          ? FiveElement.values.firstWhere((e) => e.name == hour)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'month': month,
      'day': day,
      if (hour != null) 'hour': hour,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HeavenlyFiveElementsDto &&
        other.year == year &&
        other.month == month &&
        other.day == day &&
        other.hour == hour;
  }

  @override
  int get hashCode => Object.hash(year, month, day, hour);
}

/// Data Transfer Object for Earthly Five Elements
@immutable
class EarthlyFiveElementsDto {
  const EarthlyFiveElementsDto({
    required this.year,
    required this.month,
    required this.day,
    this.hour,
  });

  factory EarthlyFiveElementsDto.fromDomain(EarthlyFiveElements elements) {
    return EarthlyFiveElementsDto(
      year: elements.year.name,
      month: elements.month.name,
      day: elements.day.name,
      hour: elements.hour?.name,
    );
  }

  factory EarthlyFiveElementsDto.fromJson(Map<String, dynamic> json) {
    return EarthlyFiveElementsDto(
      year: json['year'] as String,
      month: json['month'] as String,
      day: json['day'] as String,
      hour: json['hour'] as String?,
    );
  }

  final String year;
  final String month;
  final String day;
  final String? hour;

  EarthlyFiveElements toDomain() {
    return EarthlyFiveElements(
      year: FiveElement.values.firstWhere((e) => e.name == year),
      month: FiveElement.values.firstWhere((e) => e.name == month),
      day: FiveElement.values.firstWhere((e) => e.name == day),
      hour: hour != null
          ? FiveElement.values.firstWhere((e) => e.name == hour)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'month': month,
      'day': day,
      if (hour != null) 'hour': hour,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EarthlyFiveElementsDto &&
        other.year == year &&
        other.month == month &&
        other.day == day &&
        other.hour == hour;
  }

  @override
  int get hashCode => Object.hash(year, month, day, hour);
}