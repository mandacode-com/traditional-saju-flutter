part of './saju_model.dart';

/// Five elements
enum FiveElement {
  /// 목
  mok,

  /// 화
  hwa,

  /// 토
  to,

  /// 금
  geum,

  /// 수
  su,
  ;

  /// [FiveElement.fromString] returns the [FiveElement] from a string.
  factory FiveElement.fromString(String value) {
    return FiveElement.values.firstWhere(
      (element) => element.toString().split('.').last == value,
    );
  }

  /// [toKorean] returns the Korean name of the [FiveElement].
  String toKorean() {
    switch (this) {
      case FiveElement.mok:
        return '목';
      case FiveElement.hwa:
        return '화';
      case FiveElement.to:
        return '토';
      case FiveElement.geum:
        return '금';
      case FiveElement.su:
        return '수';
    }
  }
}
