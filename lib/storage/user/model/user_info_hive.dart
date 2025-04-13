import 'package:hive/hive.dart';
import 'package:models/models.dart';

part 'gender_hive.dart';
part 'job_status_hive.dart';
part 'dating_status_hive.dart';

part 'user_info_hive.g.dart';

/// [UserInfoHive] User info hive model
@HiveType(typeId: 0)
class UserInfoHive extends HiveObject {
  /// [UserInfoHive] User info constructor
  UserInfoHive({
    required this.gender,
    required this.jobStatus,
    required this.datingStatus,
    required this.birthdate,
    required this.permanent,
  });

  /// [UserInfoHive.fromRaw] Convert from UserInfo to UserInfoHive
  factory UserInfoHive.fromRaw(UserInfo user) {
    return UserInfoHive(
      gender: GenderHive.fromRaw(user.gender),
      jobStatus: JobStatusHive.fromRaw(user.jobStatus),
      datingStatus: DatingStatusHive.fromRaw(user.datingStatus),
      birthdate: user.birthdate,
      permanent: user.permanent,
    );
  }

  @HiveField(0)
  GenderHive gender;

  @HiveField(1)
  JobStatusHive jobStatus;

  @HiveField(2)
  DatingStatusHive datingStatus;

  @HiveField(3)
  DateTime birthdate;

  @HiveField(4)
  bool permanent;

  /// [toRaw] Convert from UserInfoHive to UserInfo
  UserInfo toRaw() {
    return UserInfo(
      gender: gender.toRaw(),
      jobStatus: jobStatus.toRaw(),
      datingStatus: datingStatus.toRaw(),
      birthdate: birthdate,
      permanent: permanent,
    );
  }
}
