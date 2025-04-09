/// [TargetRoute] TargetRoutes enum class
enum TargetRoute {
  /// [yearly]
  yearly,

  /// [daily]
  daily,
  ;

  /// [toString] method to convert enum to string
  @override
  String toString() {
    switch (this) {
      case TargetRoute.yearly:
        return 'yearly';
      case TargetRoute.daily:
        return 'daily';
    }
  }
}
