import 'package:flutter/foundation.dart';
import 'package:traditional_saju_v1/src/domain/user/value/dating_status.dart';
import 'package:traditional_saju_v1/src/domain/user/value/gender.dart';
import 'package:traditional_saju_v1/src/domain/user/value/job_status.dart';

@immutable
class UserInfo {
  const UserInfo({
    required this.gender,
    required this.jobStatus,
    required this.datingStatus,
    required this.birthdate,
    required this.permanent,
  });

  final Gender gender;
  final JobStatus jobStatus;
  final DatingStatus datingStatus;
  final DateTime birthdate;
  final bool permanent;

  UserInfo copyWith({
    Gender? gender,
    JobStatus? jobStatus,
    DatingStatus? datingStatus,
    DateTime? birthdate,
    bool? permanent,
  }) {
    return UserInfo(
      gender: gender ?? this.gender,
      jobStatus: jobStatus ?? this.jobStatus,
      datingStatus: datingStatus ?? this.datingStatus,
      birthdate: birthdate ?? this.birthdate,
      permanent: permanent ?? this.permanent,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserInfo &&
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
