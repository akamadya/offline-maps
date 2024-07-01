part of 'language_bloc.dart';

class LanguageState extends Equatable {
  const LanguageState(this.languages);

  final List<Language> languages;

  @override
  List<Object?> get props => [languages];
}
