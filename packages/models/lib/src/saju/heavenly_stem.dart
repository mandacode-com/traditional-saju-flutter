part of './saju_model.dart';

/// {@template heavenly_stem}
/// Heavenly stem
/// {@endtemplate}
enum HeavenlyStem {
  /// 갑
  gap,

  /// 을
  eul,

  /// 병
  byeong,

  /// 정
  jeong,

  /// 무
  mu,

  /// 기
  gi,

  /// 경
  gyeong,

  /// 신
  sin,

  /// 임
  im,

  /// 계
  gye,
  ;

  /// [HeavenlyStem.fromString] returns the [HeavenlyStem] from a string.
  factory HeavenlyStem.fromString(String value) {
    return HeavenlyStem.values.firstWhere(
      (element) => element.toString().split('.').last == value,
    );
  }

  /// [toKorean] returns the Korean name of the [HeavenlyStem].
  String toKorean() {
    switch (this) {
      case HeavenlyStem.gap:
        return '갑';
      case HeavenlyStem.eul:
        return '을';
      case HeavenlyStem.byeong:
        return '병';
      case HeavenlyStem.jeong:
        return '정';
      case HeavenlyStem.mu:
        return '무';
      case HeavenlyStem.gi:
        return '기';
      case HeavenlyStem.gyeong:
        return '경';
      case HeavenlyStem.sin:
        return '신';
      case HeavenlyStem.im:
        return '임';
      case HeavenlyStem.gye:
        return '계';
    }
  }
}
