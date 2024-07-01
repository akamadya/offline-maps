import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared/shared.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.remoteDataSource, this.local);

  final RemoteAuth remoteDataSource;
  final LocalAuth local;

  @override
  Future<Either<Failure, String>> signIn(ParamsRequestLogin requestData) async {
    try {
      final result = await remoteDataSource.signIn(requestData);
      await local.saveAuth(result);
      return Right(result.token);
    } on DioException catch (err) {
      final ex = err.toServerException();
      return Left(ServerFailure(message: ex.message, code: ex.code));
    } catch (err) {
      return Left(
          CodeFailure(message: 'Oops Something errors : $err', code: 0));
    }
  }

  @override
  Future<Either<Failure, AuthData>> getSavedUser() async {
    try {
      final result = await local.getData();
      return Right(result.toEntity());
    } on NotFoundCacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    await local.clearCache();
    //await localProfile.clearCache();
    return const Right(null);
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      final result = await remoteDataSource.logOut();
      return Right(result);
    } on DioException catch (err) {
      final ex = err.toServerException();
      return Left(ServerFailure(message: ex.message, code: ex.code));
    } catch (err) {
      return Left(
          CodeFailure(message: 'Oops Something errors : $err', code: 0));
    }
  }
}
