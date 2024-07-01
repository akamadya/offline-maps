import 'package:auth/auth.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_privilege_model.g.dart';

@JsonSerializable()
class UserPrivilegeModel extends Equatable {
  const UserPrivilegeModel(this.id, this.code, this.name);

  factory UserPrivilegeModel.fromJson(Map<String, dynamic> json) =>
      _$UserPrivilegeModelFromJson(json);

  final String id;
  final String code;
  final String name;

  Map<String, dynamic> toJson() => _$UserPrivilegeModelToJson(this);

  UserPrivilege toEntity() => UserPrivilege(id, code, name);

  @override
  List<Object?> get props => [id, code, name];
}
