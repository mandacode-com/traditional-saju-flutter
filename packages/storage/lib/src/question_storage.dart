/// [QuestionStorage] Question storage interface
abstract class QuestionStorage {
  /// [saveQuestion] Save question
  Future<void> saveQuestion(String question);

  /// [getQuestion] Get question
  Future<String?> getQuestion();

  /// [deleteQuestion] Delete question
  Future<void> deleteQuestion();
}
