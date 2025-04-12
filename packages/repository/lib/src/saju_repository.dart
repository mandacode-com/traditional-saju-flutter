import 'package:api/api.dart';
import 'package:api/models/daily_saju/daily_saju_request.dart';
import 'package:api/models/daily_saju/daily_saju_response.dart';
import 'package:api/models/yearly_saju/yearly_saju_request.dart';
import 'package:api/models/yearly_saju/yearly_saju_response.dart';
import 'package:dio/dio.dart';
import 'package:storage/storage.dart';

/// [SajuRepository]
class SajuRepository {
  /// [SajuRepository] constructor
  SajuRepository({
    required AuthApi authApi,
    required SajuApi sajuApi,
    required TokenStorage accessTokenStorage,
    required TokenStorage refreshTokenStorage,
    required UserStorage userMemoryStorage,
    required QuestionStorage questionMemoryStorage,
  })  : _authApi = authApi,
        _sajuApi = sajuApi,
        _accessTokenStorage = accessTokenStorage,
        _refreshTokenStorage = refreshTokenStorage,
        _userMemoryStorage = userMemoryStorage,
        _questionMemoryStorage = questionMemoryStorage;

  final AuthApi _authApi;
  final SajuApi _sajuApi;
  final TokenStorage _accessTokenStorage;
  final TokenStorage _refreshTokenStorage;
  final UserStorage _userMemoryStorage;
  final QuestionStorage _questionMemoryStorage;

  /// [yearlySaju] method
  Future<YearlySajuResponse> yearlySaju() async {
    final user = await _userMemoryStorage.getUser();
    if (user == null) {
      throw Exception('User not found');
    }
    final question = await _questionMemoryStorage.getQuestion();
    final accessToken = await _accessTokenStorage.getToken();

    final request = YearlySajuRequest(
      gender: user.gender,
      birthDateTime: user.birthdate,
      birthTimeDisabled: false, // Not implemented yet
      datingStatus: user.datingStatus,
      jobStatus: user.jobStatus,
      question: question ?? '',
    );
    final response = await tokenSafeRefresh(
      () => _sajuApi.yearlySaju(request, accessToken),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch yearly Saju');
    }
    return YearlySajuResponse.fromJson(response.data!);
  }

  /// [dailySaju] method
  Future<DailySajuResponse> dailySaju() async {
    final user = await _userMemoryStorage.getUser();
    if (user == null) {
      throw Exception('User not found');
    }
    final accessToken = await _accessTokenStorage.getToken();
    print('Access token: $accessToken');

    final request = DailySajuRequest(
      gender: user.gender,
      birthDateTime: user.birthdate,
      datingStatus: user.datingStatus,
      jobStatus: user.jobStatus,
    );
    final response = await tokenSafeRefresh(
      () => _sajuApi.dailySaju(request, accessToken),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch daily Saju');
    }
    return DailySajuResponse.fromJson(response.data!);
  }

  /// [tokenSafeRefresh] method
  Future<Response<T>> tokenSafeRefresh<T>(
    Future<Response<T>> Function() request,
  ) async {
    final response = await request();
    if (response.statusCode == 401) {
      print('Token expired, refreshing...');
      final refreshToken = await _refreshTokenStorage.getToken();
      if (refreshToken == null) {
        throw Exception('Refresh token is empty');
      }
      final refreshResponse = await _authApi.refreshToken(refreshToken);
      if (refreshResponse.accessToken.isEmpty ||
          refreshResponse.refreshToken.isEmpty) {
        throw Exception('Failed to refresh token');
      }
      await Future.wait([
        _accessTokenStorage.saveToken(refreshResponse.accessToken),
        _refreshTokenStorage.saveToken(refreshResponse.refreshToken),
      ]);
      return request();
    } else if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
