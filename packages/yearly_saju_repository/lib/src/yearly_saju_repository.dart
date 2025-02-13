import 'package:saju_api/saju_api.dart';
import 'package:saju_local_storage/saju_local_storage.dart';

/// {@template yearly_saju_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class YearlySajuRepository {
  /// {@macro _yearly_saju_repository}
  YearlySajuRepository({required this.yearlySajuApiClient});

  final YearlySajuFormStorage _yearlySajuFormStorage = YearlySajuFormStorage();

  final SajuApi yearlySajuApiClient;

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
  Future<YearlySajuResult> submitSajuForm() async {
    final form = await _yearlySajuFormStorage.copyForm();

    final ApiGenderType gender;
    switch (form.gender) {
      case GenderType.male:
        gender = ApiGenderType.male;
        break;
      case GenderType.female:
        gender = ApiGenderType.female;
        break;
      default:
        throw Exception('Invalid gender');
    }

    if (form.birthDateTime == null) {
      throw Exception('Birth date time is required');
    }

    final ApiDatingStatus datingStatus;
    switch (form.datingType) {
      case DatingStatus.single:
        datingStatus = ApiDatingStatus.single;
        break;
      case DatingStatus.married:
        datingStatus = ApiDatingStatus.married;
        break;
      case DatingStatus.dating:
        datingStatus = ApiDatingStatus.dating;
        break;
      default:
        throw Exception('Invalid dating status');
    }

    final ApiJobStatus jobStatus;
    switch (form.jobStatus) {
      case JobStatus.employed:
        jobStatus = ApiJobStatus.employed;
        break;
      case JobStatus.unemployed:
        jobStatus = ApiJobStatus.unemployed;
        break;
      case JobStatus.student:
        jobStatus = ApiJobStatus.student;
        break;
      default:
        throw Exception('Invalid job status');
    }

    final request = YearlySajuRequest(
      gender: gender,
      birthDateTime: form.birthDateTime ?? DateTime.now(),
      datingStatus: datingStatus,
      jobStatus: jobStatus,
    );

    return yearlySajuApiClient.yearlySajuApi.fetchYearlySaju(request);
  }
}
