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
    final response = await tokenSafeRequest(
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

    final request = DailySajuRequest(
      gender: user.gender,
      birthDateTime: user.birthdate,
      datingStatus: user.datingStatus,
      jobStatus: user.jobStatus,
    );
    final response = await tokenSafeRequest(
      () => _sajuApi.dailySaju(request, accessToken),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch daily Saju');
    }
    return DailySajuResponse.fromJson(response.data!);
  }

  /// [tokenSafeRequest] method
  Future<Response<T>> tokenSafeRequest<T>(
    Future<Response<T>> Function() request,
  ) async {
    final response = await request().catchError((Object e) async {
      if (e is DioException && e.response?.statusCode == 401) {
        final refreshToken = await _refreshTokenStorage.getToken();
        if (refreshToken == null) {
          throw Exception('Refresh token is empty');
        }
        final refreshResponse =
            await _authApi.refreshToken(refreshToken).catchError((e) {
          throw Exception('Failed to refresh token');
        });
        if (refreshResponse.statusCode != 200) {
          throw Exception('Failed to refresh token');
        }
        if (refreshResponse.data == null) {
          throw Exception('Failed to refresh token');
        }
        final responseAccess = refreshResponse.data!.accessToken;
        final responseRefresh = refreshResponse.data!.refreshToken;
        if (responseAccess.isEmpty || responseRefresh.isEmpty) {
          throw Exception('Failed to refresh token');
        }
        // Save the new tokens
        await Future.wait([
          _accessTokenStorage.saveToken(responseAccess),
          _refreshTokenStorage.saveToken(responseRefresh),
        ]);
        return request();
      }
      throw Exception('Failed to fetch data: $e');
    });
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch data: ${response.statusMessage}');
    }
    return response;
  }
}
