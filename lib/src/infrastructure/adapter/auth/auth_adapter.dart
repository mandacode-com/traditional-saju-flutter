import 'package:dio/dio.dart';
import 'package:traditional_saju/src/application/ports/auth/auth_port.dart';
import 'package:traditional_saju/src/domain/auth/entity/authentication.dart';
import 'package:traditional_saju/src/infrastructure/client/api_client.dart';
import 'package:traditional_saju/src/infrastructure/dto/auth/auth_response_dto.dart';

/// Implementation of AuthPort using REST API
class AuthAdapter implements AuthPort {
  const AuthAdapter({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  final ApiClient _apiClient;

  @override
  Future<Authentication> signInWithGoogle(String googleAccessToken) async {
    // googleAccessToken is the OAuth access token from Google Sign-In SDK
    final response = await _apiClient.dio.post<Map<String, dynamic>>(
      '/auth/login',
      queryParameters: {'provider': 'google'},
      options: Options(
        headers: {
          'Authorization': 'Bearer $googleAccessToken',
        },
      ),
    );

    if (response.data == null) {
      throw Exception('Login failed: No response data');
    }

    final authDto = AuthResponseDto.fromJson(response.data!);

    // Save JWT tokens from our API
    await _apiClient.saveTokens(
      accessToken: authDto.accessToken,
      refreshToken: authDto.refreshToken,
    );

    return authDto.toDomain();
  }

  @override
  Future<Authentication> signInWithKakao(String kakaoAccessToken) async {
    // kakaoAccessToken is the OAuth access token from Kakao SDK
    final response = await _apiClient.dio.post<Map<String, dynamic>>(
      '/auth/login',
      queryParameters: {'provider': 'kakao'},
      options: Options(
        headers: {
          'Authorization': kakaoAccessToken, // OAuth provider's access token
        },
      ),
    );

    if (response.data == null) {
      throw Exception('Login failed: No response data');
    }

    final authDto = AuthResponseDto.fromJson(response.data!);

    // Save JWT tokens from our API
    await _apiClient.saveTokens(
      accessToken: authDto.accessToken,
      refreshToken: authDto.refreshToken,
    );

    return authDto.toDomain();
  }

  @override
  Future<Authentication> refreshToken(String refreshToken) async {
    final response = await _apiClient.dio.post<Map<String, dynamic>>(
      '/auth/refresh',
      data: {'refreshToken': refreshToken},
    );

    if (response.data == null) {
      throw Exception('Token refresh failed: No response data');
    }

    final authDto = AuthResponseDto.fromJson(response.data!);

    // Save new tokens
    await _apiClient.saveTokens(
      accessToken: authDto.accessToken,
      refreshToken: authDto.refreshToken,
    );

    return authDto.toDomain();
  }

  @override
  Future<bool> verifyToken(String accessToken) async {
    try {
      final response = await _apiClient.dio.get<Map<String, dynamic>>(
        '/auth/verify',
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response.statusCode == 200;
    } on DioException {
      return false;
    }
  }

  @override
  Future<bool> isNotExpired(String accessToken) async {
    return verifyToken(accessToken);
  }

  @override
  Future<void> logout(String accessToken) async {
    await _apiClient.dio.post<void>(
      '/auth/logout',
      options: Options(
        headers: {'Authorization': 'Bearer $accessToken'},
      ),
    );

    // Clear stored tokens
    await _apiClient.clearTokens();
  }

  @override
  Future<void> signOut() async {
    // Just clear local tokens, no API call needed
    await _apiClient.clearTokens();
  }

  @override
  Future<bool> isAuthenticated() async {
    final accessToken = await _apiClient.getAccessToken();
    if (accessToken == null || accessToken.isEmpty) {
      return false;
    }
    return verifyToken(accessToken);
  }
}
