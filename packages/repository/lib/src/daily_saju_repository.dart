import 'package:api/api.dart';
import 'package:storage/storage.dart';

class DailySajuRepository {
  DailySajuRepository({
    required DailySajuApi api,
    required UserInfoStorage userInfoStorage,
  })  : _api = api,
        _userInfoStorage = userInfoStorage;

  final DailySajuApi _api;
  final UserInfoStorage _userInfoStorage;

  Future<DailySajuResponse> generateDailySaju() async {
    final userInfo = await _userInfoStorage.copy();

    if (userInfo.birthDateTime == null) {
      throw Exception('Birth date is required');
    }

    final DailySajuRequest request = DailySajuRequest(
      gender: userInfo.gender,
      birthDateTime: userInfo.birthDateTime!,
      datingStatus: userInfo.datingType,
      jobStatus: userInfo.jobStatus,
    );

    return _api.generateDailySaju(request);
  }
}
