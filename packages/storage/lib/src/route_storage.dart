import 'package:models/models.dart';

/// [RouteStorage] AppStorage interface
abstract class RouteStorage {
  /// [setTargetRoute] Set target route
  void setTargetRoute(AppRoutes route);

  /// [getTargetRoute] Get target route
  AppRoutes? getTargetRoute();
}
