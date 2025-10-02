import 'package:traditional_saju/src/application/ports/saju/saju_port.dart';
import 'package:traditional_saju/src/domain/saju/entity/birth_date.dart';
import 'package:traditional_saju/src/domain/saju/entity/birth_hour.dart';
import 'package:traditional_saju/src/domain/saju/entity/birth_minutes.dart';
import 'package:traditional_saju/src/domain/saju/entity/chart.dart';
import 'package:traditional_saju/src/domain/saju/entity/daily_fortune.dart';
import 'package:traditional_saju/src/domain/saju/entity/yearly_fortune.dart';
import 'package:traditional_saju/src/infrastructure/client/api_client.dart';
import 'package:traditional_saju/src/infrastructure/dto/saju/daily_saju_request_dto.dart';
import 'package:traditional_saju/src/infrastructure/dto/saju/yearly_saju_request_dto.dart';

/// Implementation of SajuPort using REST API
class SajuAdapter implements SajuPort {
  const SajuAdapter({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  final ApiClient _apiClient;

  @override
  Future<DailyFortune> getDailyFortune() async {
    // TODO(traditional_saju): Implement with user context (birth info)
    throw UnimplementedError('getDailyFortune not yet implemented');
  }

  @override
  Future<YearlyFortune> getYearlyFortune() async {
    // TODO(traditional_saju): Implement with user context (birth info)
    throw UnimplementedError('getYearlyFortune not yet implemented');
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
    // TODO(traditional_saju): Call yearly saju with birthTimeUnknown=true
    throw UnimplementedError(
      'getBasicSajuChart requires API endpoint clarification',
    );
  }

  @override
  Future<Chart> getCompleteSajuChart({
    required BirthDate birthDate,
    required BirthHour birthHour,
    required BirthMinutes birthMinutes,
  }) async {
    // TODO(traditional_saju): Map to yearly saju endpoint with user context
    throw UnimplementedError(
      'getCompleteSajuChart requires user context and proper DTO mapping',
    );
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
