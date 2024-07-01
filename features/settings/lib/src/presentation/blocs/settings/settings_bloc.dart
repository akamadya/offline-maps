import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:settings/settings.dart';
import 'package:shared/shared.dart';

part 'settings_event.dart';

part 'settings_state.dart';

const defaultSettings = SettingsState(
  Settings(
    appTheme: AppTheme.light,
    language: Language(code: 'id', name: 'Indonesia'),
    flavor: Flavor.dev,
  ),
);

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required this.getDataSettingsUseCase,
    required this.setFlavorUseCase,
    required this.setThemeUseCase,
    required this.setLanguageUseCase,
  }) : super(defaultSettings) {
    on<GetSettingsEvent>(_onGetSettingsEvent);
    on<SetTheme>(_onSetTheme);
    on<SetLanguage>(_onSetLanguage);
    on<SetFlavor>(_onSetFlavor);
  }

  final GetDataSettingsUseCase getDataSettingsUseCase;
  final SetFlavorUseCase setFlavorUseCase;
  final SetThemeUseCase setThemeUseCase;
  final SetLanguageUseCase setLanguageUseCase;

  FutureOr<void> _onGetSettingsEvent(
    GetSettingsEvent event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      final savedSettings = await getDataSettingsUseCase(const NoParams());
      savedSettings.fold(
        (failure) => emit(defaultSettings),
        (result) => emit(SettingsState(result)),
      );
    } catch (err) {
      emit(defaultSettings);
    }
  }

  FutureOr<void> _onSetTheme(
    SetTheme event,
    Emitter<SettingsState> emit,
  ) async {
    final result = await setThemeUseCase(event.theme);
    result.fold(
      (failure) => emit(state),
      (result) => emit(
        SettingsState(
          state.settings.copyWith(appTheme: event.theme),
        ),
      ),
    );
  }

  FutureOr<void> _onSetLanguage(
    SetLanguage event,
    Emitter<SettingsState> emit,
  ) async {
    final result = await setLanguageUseCase(event.language);
    result.fold(
      (failure) => emit(state),
      (result) => emit(
        SettingsState(
          state.settings.copyWith(language: event.language),
        ),
      ),
    );
  }

  FutureOr<void> _onSetFlavor(
    SetFlavor event,
    Emitter<SettingsState> emit,
  ) async {
    final result = await setFlavorUseCase(event.flavor);
    F.flavor = event.flavor;
    result.fold(
      (failure) => emit(state),
      (result) => emit(
        SettingsState(
          state.settings.copyWith(flavor: event.flavor),
        ),
      ),
    );
  }
}
