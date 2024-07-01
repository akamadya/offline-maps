// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:settings/settings.dart';

class SetLanguageUseCase implements UseCaseFuture<Failure, bool, Language> {
  SetLanguageUseCase(this.repository);

  final SettingsRepository repository;

  @override
  FutureOr<Either<Failure, bool>> call(Language params) async =>
      await repository.setLanguage(params);
}
