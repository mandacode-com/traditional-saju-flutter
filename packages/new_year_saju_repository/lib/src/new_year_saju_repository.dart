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
    bool? birthTimeDisabled,
    String? question,
    bool? questionDisabled,
  }) async {
    await _newYearSajuFormStorage.updateFormWith(
      gender: gender,
      birthDateTime: birthDateTime,
      birthTimeDisabled: birthTimeDisabled,
      question: question,
      questionDisabled: questionDisabled,
    );
  }

  /// Submit the [NewYearSajuForm] to the server.
  Future<bool> submitSajuForm() async {
    final form = await _newYearSajuFormStorage.copyForm();
    // Submit the form to the server and receive the response.

    // wait for 2 seconds to simulate the server response time.
    await Future.delayed(const Duration(seconds: 4));

    return true;
  }
}
