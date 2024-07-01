import 'package:auth/src/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc(this.useCase) : super(LogoutInitial()) {
    on<Logout>(_onLogout);
  }

  final AuthUseCaseImpl useCase;

  Future<void> _onLogout(
    Logout event,
    Emitter<LogoutState> emit,
  ) async {
    emit(LogoutLoading());
    final result = await useCase.logOut();
    result.fold(
      (failure) => emit(LogoutError(failure.message)),
      (user) => emit(LogoutLoaded()),
    );
  }
}
