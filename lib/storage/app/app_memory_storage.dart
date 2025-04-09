import 'package:models/models.dart';
import 'package:storage/storage.dart';

class AppMemoryStorage implements AppStorage {
  String? _qeustion;
  AppRoutes? _targetRoute;

  @override
  Future<void> deleteQuestion() async {
    _qeustion = null;
  }

  @override
  Future<String?> getQuestion() async {
    return _qeustion;
  }

  @override
  Future<void> saveQuestion(String question) async {
    _qeustion = question;
  }

  @override
  Future<void> setTargetRoute(AppRoutes route) async {
    _targetRoute = route;
  }

  @override
  Future<AppRoutes?> getTargetRoute() async {
    return _targetRoute;
  }
}
