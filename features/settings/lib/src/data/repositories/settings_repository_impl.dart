import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:settings/settings.dart';
import 'package:settings/src/data/data_sources/remotes/remotes.dart';
import 'package:shared/preferences/themes/enums.dart';
import 'package:shared/shared.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this.settingsLocalDataSource, this.remote);

  final SettingsLocalDataSource settingsLocalDataSource;
  final RemoteSettings remote;

  @override
  Future<Either<Failure, bool>> setFlavor(Flavor flavor) async {
    try {
      final result = await settingsLocalDataSource.setFlavor(flavor);
      return Right(result);
    } on CacheException catch (err) {
      return Left(
        CacheFailure(
          message: err.message,
          code: err.code,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> setLanguage(Language language) async {
    try {
      final result = await settingsLocalDataSource.setLanguage(language);
      return Right(result);
    } on CacheException catch (err) {
      return Left(
        CacheFailure(
          message: err.message,
          code: err.code,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> setTheme(AppTheme theme) async {
    try {
      final result = await settingsLocalDataSource.setTheme(theme);
      return Right(result);
    } on CacheException catch (err) {
      return Left(
        CacheFailure(
          message: err.message,
          code: err.code,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Settings>> getData() async {
    try {
      final result = await settingsLocalDataSource.getData();
      return Right(result);
    } on CacheException catch (err) {
      return Left(
        CacheFailure(
          message: err.message,
          code: err.code,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, int>> deleteAccount() async {
    try {
      final result = await remote.deleteAccount();
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
