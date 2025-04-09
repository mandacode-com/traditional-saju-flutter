import 'package:models/models.dart';
import 'package:storage/storage.dart';

/// [AppRepository] AppRepository class
class AppRepository {
  /// [AppRepository] constructor
  AppRepository({
    required AppStorage appStorage,
  }) : _appStorage = appStorage;

  final AppStorage _appStorage;

  /// [saveQuestion] Save question
  Future<void> saveQuestion(String question) async {
    await _appStorage.saveQuestion(question);
  }

  /// [getQuestion] Get question
  Future<String?> getQuestion() async {
    return _appStorage.getQuestion();
  }

  /// [deleteQuestion] Delete question
  Future<void> deleteQuestion() async {
    await _appStorage.deleteQuestion();
  }

  /// [setTargetRoute] Set target route
  Future<void> setTargetRoute(AppRoutes route) async {
    await _appStorage.setTargetRoute(route);
  }

  /// [getTargetRoute] Get target route
  Future<AppRoutes?> getTargetRoute() async {
    return _appStorage.getTargetRoute();
  }
}
