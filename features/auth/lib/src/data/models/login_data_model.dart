import 'package:auth/auth.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_data_model.g.dart';

@JsonSerializable()
class LoginDataModel extends Equatable {
  const LoginDataModel({
    required this.token,
    required this.expiresIn,
    required this.user,
    required this.accessMenu,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) =>
      _$LoginDataModelFromJson(json);

  @JsonKey(name: 'access_token')
  final String token;
  @JsonKey(name: 'expires_in')
  final int expiresIn;
  final UserDataModel user;
  @JsonKey(name: 'access_menu')
  final List<UserPrivilegeModel>? accessMenu;

  Map<String, dynamic> toJson() => _$LoginDataModelToJson(this);

  AuthData toEntity() => AuthData(
        token: token,
        expiresIn: expiresIn,
        user: user.toEntity(),
        accessMenu: accessMenu != null
            ? List<UserPrivilege>.from(
                accessMenu!.map<UserPrivilege>((e) => e.toEntity()))
            : [],
      );

  @override
  List<Object?> get props => [token, expiresIn, user, accessMenu];
}
