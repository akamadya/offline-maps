part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();
}

class GetSupportedLanguages extends LanguageEvent {
  @override
  List<Object?> get props => [];
}

class SelectLanguage extends LanguageEvent {
  const SelectLanguage(this.language);

  final Language language;

  @override
  List<Object?> get props => [language];
}
