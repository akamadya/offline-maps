part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {
  Authenticated(this.authData);

  final AuthData authData;
}

class UnAuthenticated extends AuthState {
  UnAuthenticated(this.message);

  final String? message;
}

class SessionExpired extends AuthState {
  SessionExpired(this.message);

  final String message;
}
