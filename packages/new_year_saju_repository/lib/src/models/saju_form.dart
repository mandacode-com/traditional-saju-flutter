/// Represents Gender type
enum GenderType {
  /// male
  male,

  /// female
  female,

  /// unknown
  unknown
}

/// {@template saju_form}
/// Form data for the Saju page.
/// {@endtemplate}
class SajuForm {
  /// {@macro saju_form}
  const SajuForm({
    GenderType? gender,
    DateTime? birthDateTime,
    String? question,
  })  : _gender = gender,
        _birthDateTime = birthDateTime,
        _question = question;

  final GenderType? _gender;
  final DateTime? _birthDateTime;
  final String? _question;

  /// Returns gender
  GenderType? get gender => _gender;

  /// Returns birthDateTime
  DateTime? get birthDateTime => _birthDateTime;

  /// Returns question
  String? get question => _question;

  /// Creates a copy of this [SajuForm] with the given fields replaced
  SajuForm copyWith({
    GenderType? gender,
    DateTime? birthDateTime,
    String? question,
  }) {
    return SajuForm(
      gender: gender ?? _gender,
      birthDateTime: birthDateTime ?? _birthDateTime,
      question: question ?? _question,
    );
  }
}
