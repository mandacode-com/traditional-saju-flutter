import 'package:models/models.dart';

/// [AppStorage] AppStorage interface
abstract class AppStorage {
  /// [setTargetRoute] Set target route
  void setTargetRoute(AppRoutes route);

  /// [getTargetRoute] Get target route
  AppRoutes? getTargetRoute();
}
