enum EarthlyBranch {
  ja,
  chuk,
  inn,
  myo,
  jin,
  sa,
  o,
  mi,
  sin,
  yu,
  sul,
  hae;

  factory EarthlyBranch.fromString(String value) {
    return EarthlyBranch.values.firstWhere(
      (element) => element.name == value,
    );
  }

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
