import 'package:models/models.dart';

/// Application local form storage
class UserInfoStorage {
  LocalStorageUserInfo _userInfo = const LocalStorageUserInfo();

  /// Returns the current form
  LocalStorageUserInfo get userInfo => _userInfo;

  /// Updates the form with the given fields
  Future<void> update({LocalStorageUserInfo? userInfo}) async {
    _userInfo = userInfo ?? _userInfo;
  }

  /// Resets the form
  Future<void> reset() async {
    _userInfo = const LocalStorageUserInfo();
  }

  /// Returns a copy of the current form
  Future<LocalStorageUserInfo> copy() async {
    return _userInfo.copyWith();
  }

  /// Updates the form with the given fields
  Future<void> updateWith({
    Gender? gender,
    DateTime? birthDateTime,
    bool? birthTimeDisabled,
    DatingStatus? datingStatus,
    JobStatus? jobStatus,
    bool? saveInfo,
    String? question,
    bool? questionDisabled,
  }) async {
    _userInfo = _userInfo.copyWith(
      gender: gender,
      birthDateTime: birthDateTime,
      birthTimeDisabled: birthTimeDisabled,
      datingType: datingStatus,
      jobStatus: jobStatus,
      saveInfo: saveInfo,
      question: question,
      questionDisabled: questionDisabled,
    );
  }
}
