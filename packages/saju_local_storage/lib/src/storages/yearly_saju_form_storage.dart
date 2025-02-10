import 'package:saju_local_storage/saju_local_storage.dart';

/// Application local form storage
class YearlySajuFormStorage {
  YearlySajuForm _form = const YearlySajuForm();

  /// Returns the current form
  YearlySajuForm get form => _form;

  /// Updates the form with the given fields
  Future<void> updateForm({YearlySajuForm? form}) async {
    _form = form ?? _form;
  }

  /// Resets the form
  Future<void> resetForm() async {
    _form = const YearlySajuForm();
  }

  /// Returns a copy of the current form
  Future<YearlySajuForm> copyForm() async {
    return _form.copyWith();
  }

  /// Updates the form with the given fields
  Future<void> updateFormWith({
    GenderType? gender,
    DateTime? birthDateTime,
    bool? birthTimeDisabled,
    DatingStatus? datingStatus,
    JobStatus? jobStatus,
    bool? saveInfo,
    String? question,
    bool? questionDisabled,
  }) async {
    _form = _form.copyWith(
      gender: gender,
      birthDateTime: birthDateTime,
      birthTimeDisabled: birthTimeDisabled,
      datingType: datingStatus,
      jobStatus: jobStatus,
      saveInfo: saveInfo,
      question: question,
      questionDisabled: questionDisabled,
    );
  }
}
