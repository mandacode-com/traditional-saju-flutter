import 'package:saju_local_storage/saju_local_storage.dart';

/// {@template new_year_saju_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class NewYearSajuRepository {
  /// {@macro new_year_saju_repository}
  NewYearSajuRepository();

  final NewYearSajuFormStorage _newYearSajuFormStorage =
      NewYearSajuFormStorage();

  /// Get the [NewYearSajuForm] from the local storage.
  Future<NewYearSajuForm> getSajuForm() async {
    return _newYearSajuFormStorage.form;
  }

  /// Save the [NewYearSajuForm] to the local storage.
  Future<void> saveSajuForm(NewYearSajuForm form) async {
    await _newYearSajuFormStorage.updateForm(form: form);
  }

  /// Reset the [NewYearSajuForm] in the local storage.
  Future<void> resetSajuForm() async {
    await _newYearSajuFormStorage.resetForm();
  }

  /// Copy the [NewYearSajuForm] from the local storage.
  Future<NewYearSajuForm> copySajuForm() async {
    return _newYearSajuFormStorage.copyForm();
  }

  /// Update the [NewYearSajuForm] in the local storage.
  Future<void> updateSajuForm({
    GenderType? gender,
    DateTime? birthDateTime,
    String? question,
  }) async {
    await _newYearSajuFormStorage.updateFormWith(
      gender: gender,
      birthDateTime: birthDateTime,
      question: question,
    );
  }
}
