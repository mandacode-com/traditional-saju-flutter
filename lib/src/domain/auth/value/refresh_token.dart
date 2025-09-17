import 'package:flutter/foundation.dart';

@immutable
class RefreshToken {
  const RefreshToken(this.value);

  final String value;

  bool get isValid => value.isNotEmpty && value.length >= 10;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RefreshToken && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}
