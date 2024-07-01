part of 'logout_bloc.dart';

@immutable
abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutError extends LogoutState {
  LogoutError(this.message);

  final String message;
}

class LogoutLoaded extends LogoutState {}
