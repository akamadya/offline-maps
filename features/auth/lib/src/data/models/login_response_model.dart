import 'package:auth/auth.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LoginResponseModel extends Equatable {
  const LoginResponseModel({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.totalData,
    required this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  final bool status;
  final int statusCode;
  final String message;
  final int totalData;
  final LoginDataModel data;

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);

  @override
  List<Object?> get props => [
        status,
        statusCode,
        message,
        totalData,
        data,
      ];
}
