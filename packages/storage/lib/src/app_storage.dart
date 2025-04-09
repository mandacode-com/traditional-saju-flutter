import 'package:models/models.dart';

/// [AppStorage] AppStorage interface
abstract class AppStorage {
  /// [saveQuestion] Save question
  Future<void> saveQuestion(String question);

  /// [getQuestion] Get question
  Future<String?> getQuestion();

  /// [deleteQuestion] Delete question
  Future<void> deleteQuestion();

  /// [setTargetRoute] Set target route
  Future<void> setTargetRoute(TargetRoute route);

  /// [getTargetRoute] Get target route
  Future<TargetRoute?> getTargetRoute();
}
