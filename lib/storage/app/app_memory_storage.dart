import 'package:storage/storage.dart';

class AppMemoryStorage implements AppStorage {
  String? _qeustion;

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
}
