import 'package:flutter/foundation.dart';
import 'package:traditional_saju/src/domain/user/entity/user.dart';
import 'package:traditional_saju/src/domain/user/value/dating_status.dart';
import 'package:traditional_saju/src/domain/user/value/gender.dart';
import 'package:traditional_saju/src/domain/user/value/job_status.dart';

/// Data Transfer Object for User API requests/responses
@immutable
class UserDto {
  const UserDto({
    required this.gender,
    required this.jobStatus,
    required this.datingStatus,
    required this.birthdate,
    required this.permanent,
  });

  factory UserDto.fromDomain(UserInfo user) {
    return UserDto(
      gender: user.gender.name,
      jobStatus: user.jobStatus.name,
      datingStatus: user.datingStatus.name,
      birthdate: user.birthdate.toIso8601String(),
      permanent: user.permanent,
    );
  }

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      gender: json['gender'] as String,
      jobStatus: json['job_status'] as String,
      datingStatus: json['dating_status'] as String,
      birthdate: json['birthdate'] as String,
      permanent: json['permanent'] as bool,
    );
  }

  final String gender;
  final String jobStatus;
  final String datingStatus;
  final String birthdate;
  final bool permanent;

  UserInfo toDomain() {
    return UserInfo(
      gender: Gender.values.firstWhere((g) => g.name == gender),
      jobStatus: JobStatus.values.firstWhere((j) => j.name == jobStatus),
      datingStatus: DatingStatus.values.firstWhere(
        (d) => d.name == datingStatus,
      ),
      birthdate: DateTime.parse(birthdate),
      permanent: permanent,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gender': gender,
      'job_status': jobStatus,
      'dating_status': datingStatus,
      'birthdate': birthdate,
      'permanent': permanent,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserDto &&
        other.gender == gender &&
        other.jobStatus == jobStatus &&
        other.datingStatus == datingStatus &&
        other.birthdate == birthdate &&
        other.permanent == permanent;
  }

  @override
  int get hashCode {
    return Object.hash(
      gender,
      jobStatus,
      datingStatus,
      birthdate,
      permanent,
    );
  }
}

/// Data Transfer Object for User creation requests
@immutable
class CreateUserRequestDto {
  const CreateUserRequestDto({
    required this.gender,
    required this.jobStatus,
    required this.datingStatus,
    required this.birthdate,
    required this.permanent,
  });

  final String gender;
  final String jobStatus;
  final String datingStatus;
  final String birthdate;
  final bool permanent;

  Map<String, dynamic> toJson() {
    return {
      'gender': gender,
      'job_status': jobStatus,
      'dating_status': datingStatus,
      'birthdate': birthdate,
      'permanent': permanent,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateUserRequestDto &&
        other.gender == gender &&
        other.jobStatus == jobStatus &&
        other.datingStatus == datingStatus &&
        other.birthdate == birthdate &&
        other.permanent == permanent;
  }

  @override
  int get hashCode {
    return Object.hash(
      gender,
      jobStatus,
      datingStatus,
      birthdate,
      permanent,
    );
  }
}

/// Data Transfer Object for User update requests
@immutable
class UpdateUserRequestDto {
  const UpdateUserRequestDto({
    this.gender,
    this.jobStatus,
    this.datingStatus,
    this.birthdate,
    this.permanent,
  });

  final String? gender;
  final String? jobStatus;
  final String? datingStatus;
  final String? birthdate;
  final bool? permanent;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    if (gender != null) json['gender'] = gender;
    if (jobStatus != null) json['job_status'] = jobStatus;
    if (datingStatus != null) json['dating_status'] = datingStatus;
    if (birthdate != null) json['birthdate'] = birthdate;
    if (permanent != null) json['permanent'] = permanent;
    return json;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateUserRequestDto &&
        other.gender == gender &&
        other.jobStatus == jobStatus &&
        other.datingStatus == datingStatus &&
        other.birthdate == birthdate &&
        other.permanent == permanent;
  }

  @override
  int get hashCode {
    return Object.hash(
      gender,
      jobStatus,
      datingStatus,
      birthdate,
      permanent,
    );
  }
}
