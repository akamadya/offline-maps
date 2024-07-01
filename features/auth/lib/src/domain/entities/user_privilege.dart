import 'package:equatable/equatable.dart';

class UserPrivilege extends Equatable {
  const UserPrivilege(this.id, this.code, this.name);

  final String id;
  final String code;
  final String name;

  @override
  List<Object?> get props => [id, code, name];
}
