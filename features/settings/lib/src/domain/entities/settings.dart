// ignore_for_file: depend_on_referenced_packages

import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:settings/src/domain/entities/entities.dart';
import 'package:shared/shared.dart';

part 'settings.g.dart';

@JsonSerializable()
class Settings extends Equatable {
  const Settings({
    required this.appTheme,
    required this.language,
    required this.flavor,
  });

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);

  @JsonKey(
    unknownEnumValue: AppConfig.baseTheme,
    defaultValue: AppConfig.baseTheme,
  )
  final AppTheme? appTheme;
  final Language? language;
  @JsonKey(
    unknownEnumValue: Flavor.prod,
    defaultValue: Flavor.prod,
  )
  final Flavor? flavor;

  Map<String, dynamic> toJson() => _$SettingsToJson(this);

  Settings copyWith({
    AppTheme? appTheme,
    Language? language,
    Flavor? flavor,
  }) =>
      Settings(
        appTheme: appTheme ?? this.appTheme,
        language: language ?? this.language,
        flavor: flavor ?? this.flavor,
      );

  @override
  List<Object?> get props => [
        appTheme,
        language,
        flavor,
      ];
}
