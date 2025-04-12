/// [FullTokenData] Auth response data model
class FullTokenData {
  /// [FullTokenData] constructor
  FullTokenData({
    required this.accessToken,
    required this.refreshToken,
  });

  /// [FullTokenData.fromJson] Factory method to create an instance from JSON
  factory FullTokenData.fromJson(Map<String, dynamic> json) {
    return FullTokenData(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );
  }

  /// [accessToken] Access token
  final String accessToken;

  /// [refreshToken] Refresh token
  final String refreshToken;

  /// [toJson] Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }
}
