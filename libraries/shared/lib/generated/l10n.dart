import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
