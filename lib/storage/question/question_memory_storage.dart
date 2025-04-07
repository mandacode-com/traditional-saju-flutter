import 'package:storage/storage.dart';

class QuestionMemoryStorage implements QuestionStorage {
  String? _question;

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
}
