import 'package:flutter/widgets.dart';
import 'package:traditional_saju/src/presentation/app/l10n/gen/app_localizations.dart';

export 'package:traditional_saju/src/presentation/app/l10n/gen/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
