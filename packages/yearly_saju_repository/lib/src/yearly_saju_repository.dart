import 'package:saju_local_storage/saju_local_storage.dart';

/// {@template yearly_saju_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class YearlySajuRepository {
  /// {@macro _yearly_saju_repository}
  YearlySajuRepository();

  final YearlySajuFormStorage _yearlySajuFormStorage =
      YearlySajuFormStorage();

  /// Get the [YearlySajuForm] from the local storage.
  Future<YearlySajuForm> getSajuForm() async {
    return _yearlySajuFormStorage.form;
  }

  /// Save the [YearlySajuForm] to the local storage.
  Future<void> saveSajuForm(YearlySajuForm form) async {
    await _yearlySajuFormStorage.updateForm(form: form);
  }

  /// Reset the [YearlySajuForm] in the local storage.
  Future<void> resetSajuForm() async {
    await _yearlySajuFormStorage.resetForm();
  }

  /// Copy the [YearlySajuForm] from the local storage.
  Future<YearlySajuForm> copySajuForm() async {
    return _yearlySajuFormStorage.copyForm();
  }

  /// Update the [YearlySajuForm] in the local storage.
  Future<void> updateSajuForm({
    GenderType? gender,
    DateTime? birthDateTime,
    bool? birthTimeDisabled,
    DatingStatus? datingStatus,
    JobStatus? jobStatus,
    bool? saveInfo,
    String? question,
    bool? questionDisabled,
  }) async {
    await _yearlySajuFormStorage.updateFormWith(
      gender: gender,
      birthDateTime: birthDateTime,
      birthTimeDisabled: birthTimeDisabled,
      datingStatus: datingStatus,
      jobStatus: jobStatus,
      saveInfo: saveInfo,
      question: question,
      questionDisabled: questionDisabled,
    );
  }

  /// Submit the [YearlySajuForm] to the server.
  Future<bool> submitSajuForm() async {
    final form = await _yearlySajuFormStorage.copyForm();
    // Submit the form to the server and receive the response.

    // wait for 2 seconds to simulate the server response time.
    await Future.delayed(const Duration(seconds: 4));

    return true;
  }
}
