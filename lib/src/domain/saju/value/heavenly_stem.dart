enum HeavenlyStem {
  gap,
  eul,
  byeong,
  jeong,
  mu,
  gi,
  gyeong,
  sin,
  im,
  gye;

  factory HeavenlyStem.fromString(String value) {
    return HeavenlyStem.values.firstWhere(
      (element) => element.name == value,
    );
  }

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
