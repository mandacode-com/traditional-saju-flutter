import 'package:saju_local_storage/saju_local_storage.dart';

/// Application local form storage
class NewYearSajuFormStorage {
  NewYearSajuForm _form = const NewYearSajuForm();

  /// Returns the current form
  NewYearSajuForm get form => _form;

  /// Updates the form with the given fields
  Future<void> updateForm({NewYearSajuForm? form}) async {
    _form = form ?? _form;
  }

  /// Resets the form
  Future<void> resetForm() async {
    _form = const NewYearSajuForm();
  }

  /// Returns a copy of the current form
  Future<NewYearSajuForm> copyForm() async {
    return _form.copyWith();
  }

  /// Updates the form with the given fields
  Future<void> updateFormWith({
    GenderType? gender,
    DateTime? birthDateTime,
    String? question,
  }) async {
    _form = _form.copyWith(
      gender: gender,
      birthDateTime: birthDateTime,
      question: question,
    );
  }
}
