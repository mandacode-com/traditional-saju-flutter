part of './saju_model.dart';

/// Earthly branch
enum EarthlyBranch {
  /// 자
  ja,

  /// 축
  chuk,

  /// 인
  inn,

  /// 묘
  myo,

  /// 진
  jin,

  /// 사
  sa,

  /// 오
  o,

  /// 미
  mi,

  /// 신
  sin,

  /// 유
  yu,

  /// 술
  sul,

  /// 해
  hae,
  ;

  /// [EarthlyBranch.fromString] Create a [EarthlyBranch] from a string
  factory EarthlyBranch.fromString(String value) {
    return EarthlyBranch.values.firstWhere(
      (element) => element.toString().split('.').last == value,
    );
  }

  /// [toKorean] returns the Korean name of the [EarthlyBranch].
  String toKorean() {
    switch (this) {
      case EarthlyBranch.ja:
        return '자';
      case EarthlyBranch.chuk:
        return '축';
      case EarthlyBranch.inn:
        return '인';
      case EarthlyBranch.myo:
        return '묘';
      case EarthlyBranch.jin:
        return '진';
      case EarthlyBranch.sa:
        return '사';
      case EarthlyBranch.o:
        return '오';
      case EarthlyBranch.mi:
        return '미';
      case EarthlyBranch.sin:
        return '신';
      case EarthlyBranch.yu:
        return '유';
      case EarthlyBranch.sul:
        return '술';
      case EarthlyBranch.hae:
        return '해';
    }
  }
}
