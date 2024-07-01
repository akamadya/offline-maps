import 'package:auth/auth.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data_model.g.dart';

@JsonSerializable()
class UserDataModel extends Equatable {
  const UserDataModel(this.id, this.name, this.username, this.email);

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);

  final int id;
  final String name;
  final String username;
  final String email;

  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);

  UserData toEntity() =>
      UserData(id: id, name: name, username: username, email: email);

  @override
  List<Object?> get props => [id, name, username, email];
}
