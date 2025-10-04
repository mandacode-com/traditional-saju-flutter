import 'package:flutter/foundation.dart';
import 'package:traditional_saju/src/domain/auth/entity/authentication.dart';
import 'package:traditional_saju/src/domain/auth/value/access_token.dart';
import 'package:traditional_saju/src/domain/auth/value/refresh_token.dart';

/// Data Transfer Object for Authentication API responses
@immutable
class AuthDto {
  const AuthDto({
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthDto.fromDomain(Authentication auth) {
    return AuthDto(
      accessToken: auth.accessToken.value,
      refreshToken: auth.refreshToken.value,
    );
  }

  factory AuthDto.fromJson(Map<String, dynamic> json) {
    return AuthDto(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
    );
  }

  final String accessToken;
  final String refreshToken;

  Authentication toDomain() {
    return Authentication(
      accessToken: AccessToken(accessToken),
      refreshToken: RefreshToken(refreshToken),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuthDto &&
        other.accessToken == accessToken &&
        other.refreshToken == refreshToken;
  }

  @override
  int get hashCode => Object.hash(accessToken, refreshToken);
}

/// Data Transfer Object for Login requests
@immutable
class LoginRequestDto {
  const LoginRequestDto({
    required this.provider,
    required this.token,
  });

  final String provider; // 'google' or 'kakao'
  final String token;

  Map<String, dynamic> toJson() {
    return {
      'provider': provider,
      'token': token,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LoginRequestDto &&
        other.provider == provider &&
        other.token == token;
  }

  @override
  int get hashCode => Object.hash(provider, token);
}

/// Data Transfer Object for Token refresh requests
@immutable
class RefreshTokenRequestDto {
  const RefreshTokenRequestDto({
    required this.refreshToken,
  });

  final String refreshToken;

  Map<String, dynamic> toJson() {
    return {
      'refresh_token': refreshToken,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RefreshTokenRequestDto &&
        other.refreshToken == refreshToken;
  }

  @override
  int get hashCode => refreshToken.hashCode;
}
