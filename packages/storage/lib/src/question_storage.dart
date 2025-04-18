/// [QuestionStorage] Question storage interface
abstract class QuestionStorage {
  /// [saveQuestion] Save question
  void saveQuestion(String question);

  /// [getQuestion] Get question
  String? getQuestion();

  /// [deleteQuestion] Delete question
  void deleteQuestion();

  /// [enableQuestion] Enable question
  void enableQuestion();

  /// [disableQuestion] Disable question
  void disableQuestion();

  /// [isQuestionEnabled] Check if question is enabled
  bool isQuestionEnabled();
}
