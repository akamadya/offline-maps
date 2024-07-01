import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

mixin AuthRepository {
  Future<Either<Failure, String>> signIn(ParamsRequestLogin requestData);
  Future<Either<Failure, AuthData>> getSavedUser();
  Future<Either<Failure, void>> clearCache();
  Future<Either<Failure, bool>> logout();
}
