part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SetInitial extends AuthEvent {}

class GetAuthStatus extends AuthEvent {}

class SetSessionExpired extends AuthEvent {}

class SignOut extends AuthEvent {}
