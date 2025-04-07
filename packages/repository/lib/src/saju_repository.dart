import 'package:api/api.dart';
import 'package:api/models/daily_saju/daily_saju_request.dart';
import 'package:api/models/daily_saju/daily_saju_response.dart';
import 'package:api/models/yearly_saju/yearly_saju_request.dart';
import 'package:api/models/yearly_saju/yearly_saju_response.dart';
import 'package:storage/storage.dart';

/// [SajuRepository]
class SajuRepository {
  /// [SajuRepository] constructor
  SajuRepository({
    required SajuApi sajuApi,
    required UserStorage userMemoryStorage,
    required QuestionStorage questionMemoryStorage,
  })  : _sajuApi = sajuApi,
        _userMemoryStorage = userMemoryStorage,
        _questionMemoryStorage = questionMemoryStorage;

  final SajuApi _sajuApi;
  final UserStorage _userMemoryStorage;
  final QuestionStorage _questionMemoryStorage;

  /// [yearlySaju] method
  Future<YearlySajuResponse> yearlySaju() async {
    final user = await _userMemoryStorage.getUser();
    if (user == null) {
      throw Exception('User not found');
    }
    final question = await _questionMemoryStorage.getQuestion();

    final request = YearlySajuRequest(
      gender: user.gender,
      birthDateTime: user.birthdate,
      birthTimeDisabled: false, // Not implemented yet
      datingStatus: user.datingStatus,
      jobStatus: user.jobStatus,
      question: question,
    );
    return _sajuApi.yearlySaju(request);
  }

  /// [dailySaju] method
  Future<DailySajuResponse> dailySaju() async {
    final user = await _userMemoryStorage.getUser();
    if (user == null) {
      throw Exception('User not found');
    }

    final request = DailySajuRequest(
      gender: user.gender,
      birthDateTime: user.birthdate,
      datingStatus: user.datingStatus,
      jobStatus: user.jobStatus,
    );
    return _sajuApi.dailySaju(request);
  }
}
