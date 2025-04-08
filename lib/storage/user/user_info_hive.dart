import 'package:hive/hive.dart';
import 'package:models/models.dart';

part 'user_info_hive.g.dart';

/// [UserHiveModel] User info hive model
@HiveType(typeId: 0)
class UserHiveModel extends HiveObject {
  /// [UserHiveModel] User info constructor
  UserHiveModel({
    required this.gender,
    required this.jobStatus,
    required this.datingStatus,
    required this.birthdate,
    required this.saved,
  });

  /// [UserHiveModel.fromUserInfo] Convert from UserInfo to UserInfoHive
  factory UserHiveModel.fromUserInfo(UserInfo user) {
    return UserHiveModel(
      gender: user.gender,
      jobStatus: user.jobStatus,
      datingStatus: user.datingStatus,
      birthdate: user.birthdate,
      saved: user.permanent,
    );
  }

  @HiveField(0)
  Gender gender;

  @HiveField(1)
  JobStatus jobStatus;

  @HiveField(2)
  DatingStatus datingStatus;

  @HiveField(3)
  DateTime birthdate;

  @HiveField(4)
  bool saved;

  /// [toUserInfo] Convert from UserInfoHive to UserInfo
  UserInfo toUserInfo() {
    return UserInfo(
      gender: gender,
      jobStatus: jobStatus,
      datingStatus: datingStatus,
      birthdate: birthdate,
      permanent: saved,
    );
  }
}
