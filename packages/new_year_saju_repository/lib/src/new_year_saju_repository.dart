import 'package:new_year_saju_repository/src/models/saju_form.dart';

/// {@template new_year_saju_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class NewYearSajuRepository {
  /// {@macro new_year_saju_repository}
  NewYearSajuRepository();

  SajuForm _localSajuForm = const SajuForm();

  /// Returns the current SajuForm
  SajuForm get sajuForm => _localSajuForm;

  /// Updates the SajuForm with the given [sajuForm]
  Future<void> updateSajuForm(SajuForm sajuForm) async {
    _localSajuForm = sajuForm;
  }

  /// Resets the SajuForm to its initial state
  Future<void> resetSajuForm() async {
    _localSajuForm = const SajuForm();
  }

  /// Updates the SajuForm with the given parameters
  SajuForm copyWith({
    GenderType? gender,
    DateTime? birthDateTime,
    String? question,
  }) {
    return SajuForm(
      gender: gender ?? _localSajuForm.gender,
      birthDateTime: birthDateTime ?? _localSajuForm.birthDateTime,
      question: question ?? _localSajuForm.question,
    );
  }
}
