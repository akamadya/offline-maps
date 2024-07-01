part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
}

class GetSettingsEvent extends SettingsEvent {
  @override
  List<Object?> get props => [];
}

class SetTheme extends SettingsEvent {
  const SetTheme(this.theme);

  final AppTheme theme;

  @override
  List<Object?> get props => [theme];
}

class SetFlavor extends SettingsEvent {
  const SetFlavor(this.flavor);

  final Flavor flavor;

  @override
  List<Object?> get props => [flavor];
}

class SetLanguage extends SettingsEvent {
  const SetLanguage(this.language);

  final Language language;

  @override
  List<Object?> get props => [language];
}
