import 'dart:async';

import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

abstract class AuthUseCase {
  Future<Either<Failure, String>> login(ParamsRequestLogin params);
  Future<Either<Failure, AuthData>> getSavedUser();
  Future<Either<Failure, void>> clearCache();
  Future<Either<Failure, bool>> logOut();
}

class AuthUseCaseImpl extends AuthUseCase {
  AuthUseCaseImpl(this.repository);

  final AuthRepository repository;

  @override
  Future<Either<Failure, String>> login(ParamsRequestLogin params) async =>
      repository.signIn(params);

  @override
  Future<Either<Failure, AuthData>> getSavedUser() async =>
      repository.getSavedUser();

  @override
  Future<Either<Failure, void>> clearCache() async => repository.clearCache();

  @override
  Future<Either<Failure, bool>> logOut() async => repository.logout();
}
