import 'package:api/api.dart';
import 'package:api/models/auth/auth_response.dart';
import 'package:api/models/auth/full_token_data.dart';
import 'package:api/models/auth/google_auth_request.dart';
import 'package:api/models/auth/verify_token_data.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_user.dart' as kakao;

/// [AuthApi] Auth API class
class AuthApi {
  /// [AuthApi] constructor
  AuthApi({
    required ApiClient apiClient,
    required GoogleSignIn googleSignIn,
    required kakao.UserApi kakaoUserApi,
  }) : _apiClient = apiClient,
       _googleSignIn = googleSignIn,
       _kakaoUserApi = kakaoUserApi;

  final ApiClient _apiClient;
  final GoogleSignIn _googleSignIn;
  final kakao.UserApi _kakaoUserApi;

  /// [verifyToken] method
  Future<AuthResponse<VerifyTokenData>> verifyToken(String token) async {
    try {
      final response = await _apiClient.get<Map<String, dynamic>>(
        '/m/token/verify',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return AuthResponse.fromJson({
        'statusCode': response.statusCode,
        'message': response.data!['message'],
        'data': response.data!['data'],
      }, VerifyTokenData.fromJson);
    } catch (e) {
      rethrow;
    }
  }

  /// [refreshToken] method
  Future<AuthResponse<FullTokenData>> refreshToken(String refreshToken) async {
    try {
      final response = await _apiClient.post<Map<String, dynamic>>(
        '/m/token/refresh',
        data: {'refreshToken': refreshToken},
      );
      if (response.statusCode != 200) {
        throw Exception('Token refresh failed');
      }
      if (response.data == null) {
        throw Exception('Token refresh failed');
      }
      return AuthResponse.fromJson({
        'statusCode': response.statusCode,
        'message': response.data!['message'],
        'data': response.data!['data'],
      }, FullTokenData.fromJson);
    } catch (e) {
      rethrow;
    }
  }

  /// [signInWithGoogle] method
  Future<AuthResponse<FullTokenData>> signInWithGoogle() async {
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
    return AuthResponse.fromJson({
      'statusCode': response.statusCode,
      'message': response.data!['message'],
      'data': response.data!['data'],
    }, FullTokenData.fromJson);
  }

  /// [signInWithKakao] method
  Future<AuthResponse<FullTokenData>> signInWithKakao() async {
    kakao.OAuthToken token;
    if (await kakao.isKakaoTalkInstalled()) {
      token = await _kakaoUserApi.loginWithKakaoTalk().catchError((e) {
        return _kakaoUserApi.loginWithKakaoAccount();
      });
    } else {
      token = await _kakaoUserApi.loginWithKakaoAccount();
    }
    if (token.accessToken.isEmpty) {
      throw Exception('Kakao sign-in failed');
    }
    final response = await _apiClient.post<Map<String, dynamic>>(
      '/m/auth/oauth/kakao/login',
      data: {'accessToken': token.accessToken},
    );
    return AuthResponse.fromJson({
      'statusCode': response.statusCode,
      'message': response.data!['message'],
      'data': response.data!['data'],
    }, FullTokenData.fromJson);
  }
}
