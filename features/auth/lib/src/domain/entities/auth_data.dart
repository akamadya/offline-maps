import 'package:auth/auth.dart';
import 'package:equatable/equatable.dart';

class AuthData extends Equatable {
  const AuthData({
    required this.token,
    required this.expiresIn,
    required this.user,
    required this.accessMenu,
  });

  final String token;
  final int expiresIn;
  final UserData user;
  final List<UserPrivilege> accessMenu;

  @override
  List<Object?> get props => [token, expiresIn, user, accessMenu];
}
