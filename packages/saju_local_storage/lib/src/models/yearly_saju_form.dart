part of 'models.dart';

/// {@template saju_form}
/// Form data for the Saju page.
/// {@endtemplate}
class YearlySajuForm {
  /// {@macro saju_form}
  const YearlySajuForm({
    GenderType? gender,
    DateTime? birthDateTime,
    bool? birthTimeDisabled,
    DatingStatus? datingType,
    JobStatus? jobStatus,
    bool? saveInfo,
    String? question,
    bool? questionDisabled,
  })  : _gender = gender,
        _birthDateTime = birthDateTime,
        _birthTimeDisabled = birthTimeDisabled,
        _datingType = datingType,
        _jobStatus = jobStatus,
        _saveInfo = saveInfo,
        _question = question,
        _questionDisabled = questionDisabled;

  final GenderType? _gender;
  final DateTime? _birthDateTime;
  final bool? _birthTimeDisabled;
  final DatingStatus? _datingType;
  final JobStatus? _jobStatus;
  final bool? _saveInfo;
  final String? _question;
  final bool? _questionDisabled;

  /// Returns gender
  GenderType? get gender => _gender;

  /// Returns birthDateTime
  DateTime? get birthDateTime => _birthDateTime;

  /// Returns birthTimeDisabled
  bool? get birthTimeDisabled => _birthTimeDisabled;

  /// Returns datingType
  DatingStatus? get datingType => _datingType;

  /// Returns jobStatus
  JobStatus? get jobStatus => _jobStatus;

  /// Returns saveInfo
  bool? get saveInfo => _saveInfo;

  /// Returns question
  String? get question => _question;

  /// Returns questionDisabled
  bool? get questionDisabled => _questionDisabled;

  /// Creates a copy of this [YearlySajuForm] with the given fields replaced
  YearlySajuForm copyWith({
    GenderType? gender,
    DateTime? birthDateTime,
    bool? birthTimeDisabled,
    DatingStatus? datingType,
    JobStatus? jobStatus,
    bool? saveInfo,
    String? question,
    bool? questionDisabled,
  }) {
    return YearlySajuForm(
      gender: gender ?? _gender,
      birthDateTime: birthDateTime ?? _birthDateTime,
      birthTimeDisabled: birthTimeDisabled ?? _birthTimeDisabled,
      datingType: datingType ?? _datingType,
      jobStatus: jobStatus ?? _jobStatus,
      saveInfo: saveInfo ?? _saveInfo,
      question: question ?? _question,
      questionDisabled: questionDisabled ?? _questionDisabled,
    );
  }
}
