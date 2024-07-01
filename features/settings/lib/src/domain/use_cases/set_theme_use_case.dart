// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:settings/settings.dart';
import 'package:shared/shared.dart';

class SetThemeUseCase implements UseCaseFuture<Failure, bool, AppTheme> {
  SetThemeUseCase(this.repository);

  final SettingsRepository repository;

  @override
  FutureOr<Either<Failure, bool>> call(AppTheme params) async =>
      await repository.setTheme(params);
}
