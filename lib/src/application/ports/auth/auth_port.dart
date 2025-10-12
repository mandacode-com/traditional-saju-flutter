import 'package:traditional_saju/src/domain/auth/entity/authentication.dart';

/// Port for authentication operations
abstract interface class AuthPort {
  /// General login method for different providers
  /// [provider] can be 'google', 'kakao', etc.
  /// [idToken] is the token received from the provider sign in
  /// Returns [Authentication] entity containing access and refresh tokens
  Future<Authentication> login(String provider, String idToken);

  /// Refresh the access token using refresh token
  /// Returns new [Authentication] entity with updated tokens
  Future<Authentication> refreshToken(String refreshToken);

  /// Verify if the current token is valid
  /// Returns true if token is valid, false otherwise
  Future<bool> verifyToken(String accessToken);

  /// Check if token is not expired
  /// Returns true if token is not expired, false otherwise
  Future<bool> isNotExpired(String accessToken);

  /// Logout user by invalidating tokens
  Future<void> logout(String accessToken);

  /// Sign out user (clear local tokens)
  Future<void> signOut();

  /// Check if user is authenticated (has valid tokens)
  Future<bool> isAuthenticated();
}
