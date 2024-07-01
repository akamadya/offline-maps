part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();
}

class SignIn extends SignInEvent {
  const SignIn(this.email, this.password, this.isSSO);

  final String email;
  final String password;
  final bool isSSO;

  @override
  List<Object?> get props => [email, password, isSSO];
}
