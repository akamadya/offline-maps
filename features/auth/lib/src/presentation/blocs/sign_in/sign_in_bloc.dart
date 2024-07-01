import 'dart:async';

import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(this.authUseCase) : super(SignInInitial()) {
    on<SignIn>(_onSignInWithEmailAndPassword);
  }

  final AuthUseCaseImpl authUseCase;

  Future<void> _onSignInWithEmailAndPassword(
    SignIn event,
    Emitter<SignInState> emit,
  ) async {
    emit(SignInLoading());

    // final result = await authUseCase.login(
    //   ParamsRequestLogin(
    //     email: event.email,
    //     password: event.password,
    //     isSso: event.isSSO,
    //     deviceUniqeId: uniqeId,
    //     deviceBrand: brand,
    //     deviceSeries: series,
    //     // deviceUniqeId: '86286904123076',
    //     // deviceBrand: 'Xiaomi',
    //     // deviceSeries: 'Redmi Note 8',
    //   ),
    // );

    // result.fold(
    //   (failure) => emit(SignInError(failure.message)),
    //   (result) => emit(SignInSuccess()),
    // );
  }
}

bool isEmailValid(String email) {
  return RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
}
