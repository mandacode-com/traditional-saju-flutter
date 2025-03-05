import 'package:api/api.dart';
import 'package:storage/storage.dart';

class YearlySajuRepository {
  YearlySajuRepository({
    required YearlySajuApi api,
    required UserInfoStorage userInfoStorage,
  })  : _api = api,
        _userInfoStorage = userInfoStorage;

  final YearlySajuApi _api;
  final UserInfoStorage _userInfoStorage;

  Future<YearlySajuResponse> generateYearlySaju() async {
    final userInfo = await _userInfoStorage.copy();

    if (userInfo.birthDateTime == null) {
      throw Exception('Birth date is required');
    }

    final YearlySajuRequest request = YearlySajuRequest(
      gender: userInfo.gender,
      birthDateTime: userInfo.birthDateTime!,
      birthTimeDisabled: userInfo.birthTimeDisabled,
      datingStatus: userInfo.datingType,
      jobStatus: userInfo.jobStatus,
      question: userInfo.question,
    );

    return _api.generateYearlySaju(request);
  }
}
