import 'package:flutter/foundation.dart';

@immutable
class AccessToken {
  const AccessToken(this.value);

  final String value;

  bool get isValid => value.isNotEmpty;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AccessToken && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}
