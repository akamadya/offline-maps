// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDataModel _$LoginDataModelFromJson(Map<String, dynamic> json) =>
    LoginDataModel(
      token: json['access_token'] as String,
      expiresIn: json['expires_in'] as int,
      user: UserDataModel.fromJson(json['user'] as Map<String, dynamic>),
      accessMenu: (json['access_menu'] as List<dynamic>?)
          ?.map((e) => UserPrivilegeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LoginDataModelToJson(LoginDataModel instance) =>
    <String, dynamic>{
      'access_token': instance.token,
      'expires_in': instance.expiresIn,
      'user': instance.user,
      'access_menu': instance.accessMenu,
    };
