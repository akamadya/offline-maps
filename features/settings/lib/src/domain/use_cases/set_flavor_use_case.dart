// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:settings/settings.dart';

class SetFlavorUseCase implements UseCaseFuture<Failure, bool, Flavor> {
  SetFlavorUseCase(this.repository);

  final SettingsRepository repository;

  @override
  FutureOr<Either<Failure, bool>> call(Flavor params) async =>
      await repository.setFlavor(params);
}
