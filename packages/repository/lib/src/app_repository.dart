import 'package:models/models.dart';
import 'package:storage/storage.dart';

/// [AppRepository] AppRepository class
class AppRepository {
  /// [AppRepository] constructor
  AppRepository({
    required AppStorage appStorage,
  }) : _appStorage = appStorage;

  final AppStorage _appStorage;

  /// [setTargetRoute] Set target route
  void setTargetRoute(AppRoutes route) {
    _appStorage.setTargetRoute(route);
  }

  /// [getTargetRoute] Get target route
  AppRoutes? getTargetRoute() {
    return _appStorage.getTargetRoute();
  }
}
