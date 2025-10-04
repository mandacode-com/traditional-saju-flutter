import 'package:traditional_saju/src/application/ports/saju/saju_port.dart';
import 'package:traditional_saju/src/domain/saju/entity/birth_date.dart';
import 'package:traditional_saju/src/domain/saju/entity/birth_hour.dart';
import 'package:traditional_saju/src/domain/saju/entity/birth_minutes.dart';
import 'package:traditional_saju/src/domain/saju/entity/chart.dart';
import 'package:traditional_saju/src/domain/saju/entity/daily_fortune.dart';
import 'package:traditional_saju/src/domain/saju/entity/yearly_fortune.dart';
import 'package:traditional_saju/src/infrastructure/client/api_client.dart';
import 'package:traditional_saju/src/infrastructure/dto/saju/daily_fortune_response_dto.dart';
import 'package:traditional_saju/src/infrastructure/dto/saju/daily_saju_request_dto.dart';
import 'package:traditional_saju/src/infrastructure/dto/saju/yearly_fortune_response_dto.dart';
import 'package:traditional_saju/src/infrastructure/dto/saju/yearly_saju_request_dto.dart';
import 'package:traditional_saju/src/infrastructure/storage/user_storage_service.dart';

/// Implementation of SajuPort using REST API
class SajuAdapter implements SajuPort {
  const SajuAdapter({
    required ApiClient apiClient,
    required UserStorageService userStorage,
  }) : _apiClient = apiClient,
       _userStorage = userStorage;

  final ApiClient _apiClient;
  final UserStorageService _userStorage;

  @override
  Future<DailyFortune> getDailyFortune() async {
    final userInfo = _userStorage.getUserInfo();
    if (userInfo == null) {
      throw Exception('User info not found');
    }

    // Convert to UTC and format as ISO8601 with Z suffix
    final birthDateTimeUtc = userInfo.birthdate.toUtc();
    final formattedDateTime = birthDateTimeUtc.toIso8601String();

    final request = DailySajuRequestDto(
      birthDateTime: formattedDateTime,
      gender: userInfo.gender.toString().split('.').last,
      datingStatus: userInfo.datingStatus.toString().split('.').last,
      jobStatus: userInfo.jobStatus.toString().split('.').last,
    );

    final responseData = await _callDailySajuApi(request);
    final dto = DailyFortuneResponseDto.fromJson(responseData);
    return dto.toDomain();
  }

  @override
  Future<YearlyFortune> getYearlyFortune() async {
    final userInfo = _userStorage.getUserInfo();
    if (userInfo == null) {
      throw Exception('User info not found');
    }

    final birthDateTime = userInfo.birthdate;
    final year = birthDateTime.year;
    final month = birthDateTime.month.toString().padLeft(2, '0');
    final day = birthDateTime.day.toString().padLeft(2, '0');
    final hour = birthDateTime.hour.toString().padLeft(2, '0');
    final minute = birthDateTime.minute.toString().padLeft(2, '0');

    // Convert to UTC and format as ISO8601 with Z suffix
    final birthDateTimeUtc = userInfo.birthdate.toUtc();
    final formattedDateTime = birthDateTimeUtc.toIso8601String();

    final request = YearlySajuRequestDto(
      birthDate: '$year-$month-$day',
      birthTime: '$hour:$minute',
      gender: userInfo.gender.toString().split('.').last,
      birthDateTime: formattedDateTime,
      datingStatus: userInfo.datingStatus.toString().split('.').last,
      jobStatus: userInfo.jobStatus.toString().split('.').last,
      birthTimeDisabled: userInfo.birthdate.hour == 0 &&
                         userInfo.birthdate.minute == 0,
    );

    final responseData = await _callYearlySajuApi(request);
    final dto = YearlyFortuneResponseDto.fromJson(responseData);
    return dto.toDomain();
  }

  @override
  Future<Chart> getSajuChart({
    required BirthDate birthDate,
    BirthHour? birthHour,
    BirthMinutes? birthMinutes,
  }) async {
    // For now, delegate to either basic or complete based on availability
    if (birthHour != null && birthMinutes != null) {
      return getCompleteSajuChart(
        birthDate: birthDate,
        birthHour: birthHour,
        birthMinutes: birthMinutes,
      );
    } else {
      return getBasicSajuChart(birthDate);
    }
  }

  @override
  Future<Chart> getBasicSajuChart(BirthDate birthDate) async {
    final userInfo = _userStorage.getUserInfo();
    if (userInfo == null) {
      throw Exception('User info not found');
    }

    final year = birthDate.value.year;
    final month = birthDate.value.month.toString().padLeft(2, '0');
    final day = birthDate.value.day.toString().padLeft(2, '0');

    // Create DateTime with 00:00 time and convert to UTC ISO8601
    final dateTime = DateTime(year, birthDate.value.month, birthDate.value.day);
    final birthDateTimeUtc = dateTime.toUtc();
    final formattedDateTime = birthDateTimeUtc.toIso8601String();

    final request = YearlySajuRequestDto(
      birthDate: '$year-$month-$day',
      birthTime: '00:00',
      gender: userInfo.gender.toString().split('.').last,
      birthDateTime: formattedDateTime,
      datingStatus: userInfo.datingStatus.toString().split('.').last,
      jobStatus: userInfo.jobStatus.toString().split('.').last,
      birthTimeDisabled: true,
      isBirthTimeUnknown: true,
    );

    final responseData = await _callYearlySajuApi(request);
    final dto = YearlyFortuneResponseDto.fromJson(responseData);
    return dto.chart.toDomain();
  }

  @override
  Future<Chart> getCompleteSajuChart({
    required BirthDate birthDate,
    required BirthHour birthHour,
    required BirthMinutes birthMinutes,
  }) async {
    final userInfo = _userStorage.getUserInfo();
    if (userInfo == null) {
      throw Exception('User info not found');
    }

    final year = birthDate.value.year;
    final month = birthDate.value.month.toString().padLeft(2, '0');
    final day = birthDate.value.day.toString().padLeft(2, '0');
    final hour = birthHour.value.toString().padLeft(2, '0');
    final minute = birthMinutes.value.toString().padLeft(2, '0');

    // Create DateTime and convert to UTC ISO8601
    final dateTime = DateTime(
      year,
      birthDate.value.month,
      birthDate.value.day,
      birthHour.value,
      birthMinutes.value,
    );
    final birthDateTimeUtc = dateTime.toUtc();
    final formattedDateTime = birthDateTimeUtc.toIso8601String();

    final request = YearlySajuRequestDto(
      birthDate: '$year-$month-$day',
      birthTime: '$hour:$minute',
      gender: userInfo.gender.toString().split('.').last,
      birthDateTime: formattedDateTime,
      datingStatus: userInfo.datingStatus.toString().split('.').last,
      jobStatus: userInfo.jobStatus.toString().split('.').last,
      birthTimeDisabled: false,
    );

    final responseData = await _callYearlySajuApi(request);
    final dto = YearlyFortuneResponseDto.fromJson(responseData);
    return dto.chart.toDomain();
  }

  // Helper method for future use
  Future<Map<String, dynamic>> _callDailySajuApi(
    DailySajuRequestDto request,
  ) async {
    final response = await _apiClient.dio.post<Map<String, dynamic>>(
      '/saju/daily',
      data: request.toJson(),
    );

    if (response.data == null) {
      throw Exception('Daily saju request failed: No response data');
    }

    return response.data!;
  }

  // Helper method for future use
  Future<Map<String, dynamic>> _callYearlySajuApi(
    YearlySajuRequestDto request,
  ) async {
    final response = await _apiClient.dio.post<Map<String, dynamic>>(
      '/saju/yearly',
      data: request.toJson(),
    );

    if (response.data == null) {
      throw Exception('Yearly saju request failed: No response data');
    }

    return response.data!;
  }
}
