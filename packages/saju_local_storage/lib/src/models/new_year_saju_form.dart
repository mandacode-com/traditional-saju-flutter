part of 'models.dart';

/// {@template saju_form}
/// Form data for the Saju page.
/// {@endtemplate}
class NewYearSajuForm {
  /// {@macro saju_form}
  const NewYearSajuForm({
    GenderType? gender,
    DateTime? birthDateTime,
    bool? birthTimeDisabled,
    String? question,
    bool? questionDisabled,
  })  : _gender = gender,
        _birthDateTime = birthDateTime,
        _birthTimeDisabled = birthTimeDisabled,
        _question = question,
        _questionDisabled = questionDisabled;

  final GenderType? _gender;
  final DateTime? _birthDateTime;
  final bool? _birthTimeDisabled;
  final String? _question;
  final bool? _questionDisabled;

  /// Returns gender
  GenderType? get gender => _gender;

  /// Returns birthDateTime
  DateTime? get birthDateTime => _birthDateTime;

  /// Returns birthTimeDisabled
  bool? get birthTimeDisabled => _birthTimeDisabled;

  /// Returns question
  String? get question => _question;

  /// Returns questionDisabled
  bool? get questionDisabled => _questionDisabled;

  /// Creates a copy of this [NewYearSajuForm] with the given fields replaced
  NewYearSajuForm copyWith({
    GenderType? gender,
    DateTime? birthDateTime,
    bool? birthTimeDisabled,
    String? question,
    bool? questionDisabled,
  }) {
    return NewYearSajuForm(
      gender: gender ?? _gender,
      birthDateTime: birthDateTime ?? _birthDateTime,
      birthTimeDisabled: birthTimeDisabled ?? _birthTimeDisabled,
      question: question ?? _question,
      questionDisabled: questionDisabled ?? _questionDisabled,
    );
  }
}
