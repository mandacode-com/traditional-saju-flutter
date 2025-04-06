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

  /// [signInWithGoogle] method
  Future<Response<AuthResponse>> signInWithGoogle() async {
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

      return _apiClient.post<AuthResponse>(
        '/auth/google',
        data: googleAuthRequest.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }
}
