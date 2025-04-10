import 'package:api/api.dart';
import 'package:api/models/auth/auth_response.dart';
import 'package:api/models/auth/google_auth_request.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// [AuthApi] Auth API class
class AuthApi {
  /// [AuthApi] constructor
  AuthApi({
    required ApiClient apiClient,
    required GoogleSignIn googleSignIn,
  })  : _apiClient = apiClient,
        _googleSignIn = googleSignIn;

  final ApiClient _apiClient;
  final GoogleSignIn _googleSignIn;

  /// [verifyToken] method
  Future<AuthResponse> verifyToken(String token) async {
    try {
      final response = await _apiClient.get<Map<String, dynamic>>(
        '/m/token/verify',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode != 200) {
        throw Exception('Token verification failed');
      }
      return AuthResponse.fromJson(response.data!);
    } catch (e) {
      rethrow;
    }
  }

  /// [refreshToken] method
  Future<AuthResponse> refreshToken(String refreshToken) async {
    try {
      final response = await _apiClient.post<Map<String, dynamic>>(
        '/m/token/refresh',
        data: {
          'refreshToken': refreshToken,
        },
      );
      if (response.statusCode != 200) {
        throw Exception('Token refresh failed');
      }
      return AuthResponse.fromJson(response.data!);
    } catch (e) {
      rethrow;
    }
  }

  /// [signInWithGoogle] method
  Future<AuthResponse> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception('Google sign-in failed');
      }
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken == null || googleAuth.accessToken == null) {
        throw Exception('Google authentication failed');
      }
      final googleAuthRequest = GoogleAuthRequest.fromJson({
        'idToken': googleAuth.idToken,
        'accessToken': googleAuth.accessToken,
      });

      final response = await _apiClient.post<Map<String, dynamic>>(
        '/m/auth/oauth/google/login',
        data: googleAuthRequest.toJson(),
      );
      if (response.statusCode != 200) {
        throw Exception('Google sign-in failed');
      }
      return AuthResponse.fromJson(response.data!);
    } catch (e) {
      rethrow;
    }
  }
}
