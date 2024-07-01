import 'dart:convert';

import 'package:core/core.dart';
import 'package:settings/settings.dart';
import 'package:shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingsLocalDataSource implements CacheDataSource<Settings> {
  Future<bool> setTheme(AppTheme theme);

  Future<bool> setFlavor(Flavor flavor);

  Future<bool> setLanguage(Language language);
}

class SettingsLocalDataSourceImpl extends SettingsLocalDataSource {
  SettingsLocalDataSourceImpl(this.preferences);

  final SharedPreferences preferences;
  @override
  String cacheKey = 'settings';

  @override
  Future<bool> clearCache() async {
    try {
      await preferences.remove(cacheKey);
      return true;
    } catch (err) {
      throw const CacheException(message: "can't clear cache", code: 1);
    }
  }

  @override
  Future<Settings> getData() async {
    try {
      final rawData = preferences.getString(cacheKey);
      final data =
          json.decode(rawData!) as Map<String, dynamic>;
      return Settings.fromJson(data);
    } catch (err) {
      throw const CacheException(message: 'Cache Not Found!', code: 1);
    }
  }

  @override
  Future<bool> isCached() async {
    return preferences.getString(cacheKey) != null;
  }

  @override
  Future<bool> saveCache(Settings data) async {
    try {
      final jsonData = json.encode(data.toJson());
      await preferences.setString(cacheKey, jsonData);
      return true;
    } catch (err) {
      throw CacheException(message: err.toString(), code: 1);
    }
  }

  @override
  Future<bool> setFlavor(Flavor flavor) async {
    try {
      if (await isCached()) {
        final cache = await getData();
        final newCache = cache.copyWith(
          flavor: flavor,
        );
        await saveCache(newCache);
        return true;
      }

      await saveCache(
        const Settings(
          appTheme: AppConfig.baseTheme,
          language: null,
          flavor: Flavor.prod,
        ),
      );
      return true;
    } catch (err) {
      throw CacheException(message: err.toString(), code: 1);
    }
  }

  @override
  Future<bool> setLanguage(Language language) async {
    try {
      if (await isCached()) {
        final cache = await getData();
        final newCache = cache.copyWith(
          language: language,
        );
        await saveCache(newCache);
        return true;
      }

      await saveCache(
        Settings(
          appTheme: AppConfig.baseTheme,
          language: language,
          flavor: Flavor.prod,
        ),
      );
      return true;
    } catch (err) {
      throw CacheException(message: err.toString(), code: 1);
    }
  }

  @override
  Future<bool> setTheme(AppTheme theme) async {
    try {
      if (await isCached()) {
        final cache = await getData();
        final newCache = cache.copyWith(
          appTheme: theme,
        );
        await saveCache(newCache);
        return true;
      }

      await saveCache(
        Settings(
          appTheme: theme,
          language: null,
          flavor: Flavor.prod,
        ),
      );
      return true;
    } catch (err) {
      throw CacheException(message: err.toString(), code: 1);
    }
  }
}
