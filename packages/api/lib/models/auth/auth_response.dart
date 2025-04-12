/// [AuthResponse] Auth response model
class AuthResponse<T> {
  /// [AuthResponse] constructor
  AuthResponse({
    required this.statusCode,
    required this.message,
    this.data,
  });

  /// [AuthResponse.fromJson] Factory method to create an instance from JSON
  factory AuthResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>)? dataFromJson,
  ) {
    return AuthResponse(
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
      data: dataFromJson != null
          ? dataFromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  /// [statusCode] HTTP status code
  final int statusCode;

  /// [message] HTTP status message
  final String message;

  /// [data] Auth response data
  final T? data;

  /// [dataToJson] Convert to JSON
  Map<String, dynamic> toJson(
    T Function(T)? dataToJson,
  ) {
    if (data != null && dataToJson == null) {
      throw Exception('dataToJson function is required when data is not null');
    }
    return {
      'statusCode': statusCode,
      'message': message,
      'data': data != null ? dataToJson!(data as T) : null,
    };
  }
}
