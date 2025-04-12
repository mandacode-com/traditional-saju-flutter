/// [AppRoutes] TargetRoutes enum class
enum AppRoutes {
  /// [home]
  home,

  /// [homeSample]
  homeSample,

  /// [userInfoBase]
  userInfoBase,

  /// [userInfoDetail]
  userInfoDetail,

  /// [yearlyResult]
  yearlyResult,

  /// [dailyResult]
  dailyResult,
  ;

  /// [toString] method to convert enum to string
  @override
  String toString() {
    switch (this) {
      case AppRoutes.home:
        return 'home';
      case AppRoutes.homeSample:
        return 'home/sample';
      case AppRoutes.userInfoBase:
        return 'user/info/base';
      case AppRoutes.userInfoDetail:
        return 'user/info/detail';
      case AppRoutes.yearlyResult:
        return 'result/yearly';
      case AppRoutes.dailyResult:
        return 'result/daily';
    }
  }
}
