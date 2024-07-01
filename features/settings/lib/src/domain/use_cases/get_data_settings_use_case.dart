// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:settings/settings.dart';
import 'package:shared/shared.dart';

class GetDataSettingsUseCase
    implements UseCaseFuture<Failure, Settings, NoParams> {
  GetDataSettingsUseCase(this.repository);

  final SettingsRepository repository;

  @override
  FutureOr<Either<Failure, Settings>> call(NoParams params) async =>
      await repository.getData();
}
