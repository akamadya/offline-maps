import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';

part 'delete_account_event.dart';
part 'delete_account_state.dart';

class DeleteAccountBloc extends Bloc<DeleteAccountEvent, DeleteAccountState> {
  DeleteAccountBloc(this.settingsUsecaseImpl) : super(DeleteAccountInitial()) {
    on<DeleteAccount>(_onDeleteAccount);
  }

  final SettingsUsecaseImpl settingsUsecaseImpl;

  DateTime dateInitial = DateTime.now();

  Future<void> _onDeleteAccount(
      DeleteAccount event, Emitter<DeleteAccountState> emit) async {
    emit(DeleteAccountLoading());

    final result = await settingsUsecaseImpl.deleteAccount();
    result.fold(
      (l) => emit(DeleteAccountError(l.message)),
      (r) => emit(DeleteAccountLoaded()),
    );
  }
}
