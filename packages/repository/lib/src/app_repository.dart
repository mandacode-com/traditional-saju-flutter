import 'package:models/models.dart';
import 'package:storage/storage.dart';

/// [AppRepository] AppRepository class
class AppRepository {
  /// [AppRepository] constructor
  AppRepository({
    required RouteStorage routeStorage,
    required QuestionStorage questionStorage,
  })  : _routeStorage = routeStorage,
        _questionStorage = questionStorage;

  final RouteStorage _routeStorage;
  final QuestionStorage _questionStorage;

  /// [setTargetRoute] Set target route
  void setTargetRoute(AppRoutes route) {
    _routeStorage.setTargetRoute(route);
  }

  /// [getTargetRoute] Get target route
  AppRoutes? getTargetRoute() {
    return _routeStorage.getTargetRoute();
  }

  /// [setQuestion] Set question
  void setQuestion(String question) {
    _questionStorage.saveQuestion(question);
  }

  /// [getQuestion] Get question
  String? getQuestion() {
    return _questionStorage.getQuestion();
  }

  /// [deleteQuestion] Delete question
  void deleteQuestion() {
    _questionStorage.deleteQuestion();
  }
}
