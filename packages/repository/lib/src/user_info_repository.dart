import 'package:models/models.dart';
import 'package:storage/storage.dart';

class UserInfoRepository {
  UserInfoRepository({
    required UserInfoStorage userInfoStorage,
  }) : _userInfoStorage = userInfoStorage;

  final UserInfoStorage _userInfoStorage;

  Future<LocalStorageUserInfo> getUserInfo() async {
    return _userInfoStorage.userInfo;
  }

  Future<void> saveUserInfo(LocalStorageUserInfo userInfo) async {
    await _userInfoStorage.update(userInfo: userInfo);
  }

  Future<void> resetUserInfo() async {
    await _userInfoStorage.reset();
  }

  Future<LocalStorageUserInfo> copyUserInfo() async {
    return _userInfoStorage.copy();
  }

  Future<void> updateUserInfoWith({
    Gender? gender,
    DateTime? birthDateTime,
    bool? birthTimeDisabled,
    DatingStatus? datingStatus,
    JobStatus? jobStatus,
    bool? saveInfo,
    String? question,
    bool? questionDisabled,
  }) async {
    await _userInfoStorage.updateWith(
      gender: gender,
      birthDateTime: birthDateTime,
      birthTimeDisabled: birthTimeDisabled,
      datingStatus: datingStatus,
      jobStatus: jobStatus,
      saveInfo: saveInfo,
      question: question,
      questionDisabled: questionDisabled,
    );
  }
}
