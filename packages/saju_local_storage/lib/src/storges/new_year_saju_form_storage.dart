import 'package:saju_local_storage/src/models/new_year_saju_form.dart';

/// {@template new_year_saju_form_storage}
/// New Year Saju Form Storage
/// {@endtemplate}
class NewYearSajuFormStorage {
  NewYearSajuForm _newYearSajuForm = const NewYearSajuForm();

  /// Returns the current NewYearSajuForm
  NewYearSajuForm get newYearSajuForm => _newYearSajuForm;

  /// Updates the NewYearSajuForm with the given [newYearSajuForm]
  Future<void> updateNewYearSajuForm(NewYearSajuForm newYearSajuForm) async {
    _newYearSajuForm = newYearSajuForm;
  }

  /// Resets the NewYearSajuForm to its initial state
  Future<void> resetNewYearSajuForm() async {
    _newYearSajuForm = const NewYearSajuForm();
  }
}
