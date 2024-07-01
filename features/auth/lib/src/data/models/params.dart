import 'dart:convert';
import 'package:equatable/equatable.dart';

class ParamsRequestLogin extends Equatable {
  const ParamsRequestLogin({
    required this.email,
    required this.password,
    required this.isSso,
    this.deviceUniqeId,
    this.deviceBrand,
    this.deviceSeries,
  });

  final String email;
  final String password;
  final bool isSso;
  final String? deviceUniqeId;
  final String? deviceBrand;
  final String? deviceSeries;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': email,
      'password': password,
      'device_unique_id': deviceUniqeId,
      'device_brand': deviceBrand,
      'device_series': deviceSeries,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [email, password];
}
