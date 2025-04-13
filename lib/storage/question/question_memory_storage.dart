import 'package:storage/storage.dart';

class QuestionMemoryStorage implements QuestionStorage {
  String? _question;
  bool _isEnabled = true;

  @override
  void deleteQuestion() {
    _question = null;
  }

  @override
  String? getQuestion() {
    return _question;
  }

  @override
  void saveQuestion(String question) {
    _question = question;
  }

  @override
  void disableQuestion() {
    _isEnabled = false;
  }

  @override
  void enableQuestion() {
    _isEnabled = true;
  }

  @override
  bool isQuestionEnabled() {
    return _isEnabled;
  }
}
