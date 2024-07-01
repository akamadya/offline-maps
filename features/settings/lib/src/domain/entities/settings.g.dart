// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Settings _$SettingsFromJson(Map<String, dynamic> json) => Settings(
      appTheme: $enumDecodeNullable(_$AppThemeEnumMap, json['appTheme'],
              unknownValue: AppTheme.light) ??
          AppTheme.light,
      language: json['language'] == null
          ? null
          : Language.fromJson(json['language'] as Map<String, dynamic>),
      flavor: $enumDecodeNullable(_$FlavorEnumMap, json['flavor'],
              unknownValue: Flavor.prod) ??
          Flavor.prod,
    );

Map<String, dynamic> _$SettingsToJson(Settings instance) => <String, dynamic>{
      'appTheme': _$AppThemeEnumMap[instance.appTheme],
      'language': instance.language,
      'flavor': _$FlavorEnumMap[instance.flavor],
    };

const _$AppThemeEnumMap = {
  AppTheme.light: 'light',
  AppTheme.dark: 'dark',
};

const _$FlavorEnumMap = {
  Flavor.dev: 'dev',
  Flavor.stag: 'stag',
  Flavor.prod: 'prod',
};
