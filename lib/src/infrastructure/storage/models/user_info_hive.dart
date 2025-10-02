import 'package:hive/hive.dart';
import 'package:traditional_saju/src/domain/user/entity/user.dart';
import 'package:traditional_saju/src/domain/user/value/dating_status.dart';
import 'package:traditional_saju/src/domain/user/value/gender.dart';
import 'package:traditional_saju/src/domain/user/value/job_status.dart';

part 'user_info_hive.g.dart';

@HiveType(typeId: 0)
class UserInfoHive extends HiveObject {
  UserInfoHive({
    required this.gender,
    required this.jobStatus,
    required this.datingStatus,
    required this.birthdate,
    required this.permanent,
  });

  factory UserInfoHive.fromDomain(UserInfo userInfo) {
    return UserInfoHive(
      gender: userInfo.gender.toString().split('.').last,
      jobStatus: userInfo.jobStatus.toString().split('.').last,
      datingStatus: userInfo.datingStatus.toString().split('.').last,
      birthdate: userInfo.birthdate.toIso8601String(),
      permanent: userInfo.permanent,
    );
  }

  @HiveField(0)
  String gender;

  @HiveField(1)
  String jobStatus;

  @HiveField(2)
  String datingStatus;

  @HiveField(3)
  String birthdate;

  @HiveField(4)
  bool permanent;

  UserInfo toDomain() {
    return UserInfo(
      gender: _parseGender(gender),
      jobStatus: _parseJobStatus(jobStatus),
      datingStatus: _parseDatingStatus(datingStatus),
      birthdate: DateTime.parse(birthdate),
      permanent: permanent,
    );
  }

  Gender _parseGender(String value) {
    switch (value) {
      case 'male':
        return Gender.male;
      case 'female':
        return Gender.female;
      default:
        return Gender.male;
    }
  }

  JobStatus _parseJobStatus(String value) {
    switch (value) {
      case 'employed':
        return JobStatus.employed;
      case 'unemployed':
        return JobStatus.unemployed;
      case 'student':
        return JobStatus.student;
      default:
        return JobStatus.student;
    }
  }

  DatingStatus _parseDatingStatus(String value) {
    switch (value) {
      case 'single':
        return DatingStatus.single;
      case 'dating':
        return DatingStatus.dating;
      case 'married':
        return DatingStatus.married;
      default:
        return DatingStatus.single;
    }
  }
}
