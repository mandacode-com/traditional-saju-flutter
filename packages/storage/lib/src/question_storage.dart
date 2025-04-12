/// [QuestionStorage] Question storage interface
abstract class QuestionStorage {
  /// [saveQuestion] Save question
  Future<void> saveQuestion(String question);

  /// [getQuestion] Get question
  Future<String?> getQuestion();

  /// [deleteQuestion] Delete question
  Future<void> deleteQuestion();

  /// [enableQuestion] Enable question
  void enableQuestion();

  /// [disableQuestion] Disable question
  void disableQuestion();

  /// [isQuestionEnabled] Check if question is enabled
  bool isQuestionEnabled();
}
