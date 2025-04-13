import 'package:models/models.dart';
import 'package:storage/storage.dart';

class RouteMemoryStorage implements RouteStorage {
  AppRoutes? _targetRoute;

  @override
  void setTargetRoute(AppRoutes route) {
    _targetRoute = route;
  }

  @override
  AppRoutes? getTargetRoute() {
    return _targetRoute;
  }
}
