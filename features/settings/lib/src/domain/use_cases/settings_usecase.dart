// ignore_for_file: depend_on_referenced_packages

import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:settings/settings.dart';

abstract class SettingUsecase {
  Future<Either<Failure, int>> deleteAccount();
}

class SettingsUsecaseImpl extends SettingUsecase {
  SettingsUsecaseImpl(this.repository);

  final SettingsRepository repository;

  @override
  Future<Either<Failure, int>> deleteAccount() async =>
      repository.deleteAccount();
}
