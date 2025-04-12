/// [VerifyTokenData] Auth response data model
class VerifyTokenData {
  /// [VerifyTokenData] constructor
  VerifyTokenData({
    required this.role,
    required this.uuid,
  });

  /// [VerifyTokenData.fromJson] Factory method to create an instance from JSON
  factory VerifyTokenData.fromJson(Map<String, dynamic> json) {
    return VerifyTokenData(
      role: json['role'] as String,
      uuid: json['uuid'] as String,
    );
  }

  /// [role] User role
  final String role;

  /// [uuid] User UUID
  final String uuid;

  /// [toJson] Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'uuid': uuid,
    };
  }
}
