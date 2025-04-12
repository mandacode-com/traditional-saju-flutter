import 'package:storage/storage.dart';

class QuestionMemoryStorage implements QuestionStorage {
  String? _question;
  bool _isEnabled = true;

  @override
  Future<void> deleteQuestion() async {
    _question = null;
  }

  @override
  Future<String?> getQuestion() async {
    return _question;
  }

  @override
  Future<void> saveQuestion(String question) async {
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
