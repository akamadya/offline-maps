// ignore_for_file: depend_on_referenced_packages

import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:settings/settings.dart';
import 'package:shared/shared.dart';

abstract class SettingsRepository {
  Future<Either<Failure, Settings>> getData();

  Future<Either<Failure, bool>> setTheme(AppTheme theme);

  Future<Either<Failure, bool>> setLanguage(Language language);

  Future<Either<Failure, bool>> setFlavor(Flavor flavor);

  Future<Either<Failure, int>> deleteAccount();
}
