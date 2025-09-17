import 'package:flutter/foundation.dart';
import 'package:traditional_saju_v1/src/domain/auth/value/access_token.dart';
import 'package:traditional_saju_v1/src/domain/auth/value/refresh_token.dart';

@immutable
class Authentication {
  const Authentication({
    required this.accessToken,
    required this.refreshToken,
  });

  final AccessToken accessToken;
  final RefreshToken refreshToken;

  bool get isValid => accessToken.isValid && refreshToken.isValid;

  Authentication copyWith({
    AccessToken? accessToken,
    RefreshToken? refreshToken,
  }) {
    return Authentication(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Authentication &&
        other.accessToken == accessToken &&
        other.refreshToken == refreshToken;
  }

  @override
  int get hashCode => Object.hash(accessToken, refreshToken);
}
