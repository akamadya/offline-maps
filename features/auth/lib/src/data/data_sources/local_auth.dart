import 'dart:convert';

import 'package:auth/src/data/data.dart';
import 'package:core/data/data_sources/data_sources.dart';
import 'package:core/exceptions/cache_exception.dart';
import 'package:hive/hive.dart';

abstract class LocalAuth extends CacheDataSource<LoginDataModel> {
  Future<bool> saveAuth(LoginDataModel data);
}

class LocalAuthImpl extends LocalAuth {
  LocalAuthImpl(this.hive);

  final HiveInterface hive;

  @override
  String get cacheKey => 'AUTH_CACHE_KEY';

  @override
  Future<bool> clearCache() async {
    try {
      final box = await _getBox();
      await box?.clear();

      return true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<LoginDataModel> getData() async {
    try {
      final box = await _getBox();
      final boxData = box?.get('data');
      if (boxData != null && boxData is String) {
        return LoginDataModel.fromJson(
          json.decode(boxData) as Map<String, dynamic>,
        );
      }

      throw const NotFoundCacheException(message: 'Cache Not Found');
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> isCached() async {
    try {
      final box = await _getBox();

      return box?.get('data') != null;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> saveCache(LoginDataModel data) async {
    try {
      final box = await _getBox();

      await box?.put('data', json.encode(data.toJson()));

      return true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future<Box<Object?>?> _getBox() async {
    if (!hive.isBoxOpen(cacheKey)) {
      return hive.openBox(cacheKey);
    }

    return hive.box(cacheKey);
  }

  @override
  Future<bool> saveAuth(LoginDataModel data) async {
    try {
      if (await isCached()) {
        await clearCache();
      }

      await saveCache(
        data,
      );

      return true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
