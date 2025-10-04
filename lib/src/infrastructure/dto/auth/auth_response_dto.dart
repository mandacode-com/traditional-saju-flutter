import 'package:traditional_saju/src/domain/auth/entity/authentication.dart';
import 'package:traditional_saju/src/domain/auth/value/access_token.dart';
import 'package:traditional_saju/src/domain/auth/value/refresh_token.dart';

/// DTO for authentication response
class AuthResponseDto {
  const AuthResponseDto({
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) {
    return AuthResponseDto(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );
  }

  final String accessToken;
  final String refreshToken;

  /// Convert DTO to Domain Entity
  Authentication toDomain() {
    return Authentication(
      accessToken: AccessToken(accessToken),
      refreshToken: RefreshToken(refreshToken),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }
}
