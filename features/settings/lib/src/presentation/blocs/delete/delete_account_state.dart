part of 'delete_account_bloc.dart';

@immutable
abstract class DeleteAccountState {}

class DeleteAccountInitial extends DeleteAccountState {}

class DeleteAccountLoading extends DeleteAccountState {}

class DeleteAccountError extends DeleteAccountState {
  DeleteAccountError(this.message);

  final String message;
}

class DeleteAccountLoaded extends DeleteAccountState {
  DeleteAccountLoaded();
}
