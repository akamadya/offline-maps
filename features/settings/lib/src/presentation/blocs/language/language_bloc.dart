import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';
import 'package:shared/shared.dart';

part 'language_event.dart';

part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState([])) {
    on<GetSupportedLanguages>((event, emit) {
      final languages = <Language>[];
      const localization = AppLocalizations.supportedLocales;
      for (final locale in localization) {
        languages.add(
          Language(code: locale.languageCode, name: locale.toLanguageTag()),
        );
      }
      emit(LanguageState(languages));
    });
  }
}

extension LanguageX on Language {
  Locale toLocale() => Locale(code);
}
