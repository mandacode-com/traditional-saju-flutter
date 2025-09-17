enum FiveElement {
  mok,
  hwa,
  to,
  geum,
  su;

  factory FiveElement.fromString(String value) {
    return FiveElement.values.firstWhere(
      (element) => element.name == value,
    );
  }

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
