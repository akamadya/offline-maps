import 'dart:async';

import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.useCase) : super(AuthInitial()) {
    on<GetAuthStatus>(_onGetAuthStatus);
    on<SetSessionExpired>(_onSetSessionExpired);
    on<SignOut>(_onSignOut);
    on<SetInitial>(_onInitial);
  }

  Future<void> _onInitial(
    SetInitial event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthInitial());
  }

  Future<void> _onGetAuthStatus(
    GetAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    final result = await useCase.getSavedUser();
    result.fold(
      (failure) => emit(UnAuthenticated(failure.message)),
      (user) => emit(
        Authenticated(user),
      ),
    );
  }

  Future<void> _onSetSessionExpired(
    SetSessionExpired event,
    Emitter<AuthState> emit,
  ) async {
    //emit(SessionExpired('sesi berakhir, harap login kembali!'));
    await useCase.clearCache();
    emit(UnAuthenticated('sesi berakhir, harap login kembali!'));
  }

  Future<void> _onSignOut(
    SignOut event,
    Emitter<AuthState> emit,
  ) async {
    await useCase.clearCache();
    emit(UnAuthenticated('Anda telah keluar!'));
  }

  final AuthUseCaseImpl useCase;
}
