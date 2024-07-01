// ignore_for_file: avoid_positional_boolean_parameters

import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import 'app_preferences_key.dart';

class AppPreferences {
  const AppPreferences(this.preferences);

  final SharedPreferences preferences;

  bool get isFirstTime {
    return preferences.getBool(AppPreferenceKeys.isFirstTime) ?? true;
  }

  Future<void> setBool(String key, bool val) async {
    await preferences.setBool(key, val);
  }

  bool getBool(String key) {
    return preferences.getBool(key) ?? false;
  }

  Future<void> saveString(String key, String model) async {
    await preferences.setString(key, model);
  }

  String getString(String key) {
    return preferences.getString(key) ?? '';
  }

  Future<void> removeAllString() async {
    await preferences.remove(AppPreferenceKeys.isFirstTime);
  }
}
