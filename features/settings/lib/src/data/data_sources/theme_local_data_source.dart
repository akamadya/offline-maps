import 'package:core/core.dart';
import 'package:shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeLocalDataSource implements CacheDataSource<AppTheme> {
  ThemeLocalDataSource(this.preferences);

  final SharedPreferences preferences;

  @override
  String cacheKey = 'theme';

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
  Future<AppTheme> getData() async {
    try {
      final theme = preferences.getString(cacheKey);
      if (theme == null) {
        return AppConfig.baseTheme;
      } else {
        return theme.toAppTheme();
      }
    } catch (err) {
      throw const CacheException(message: 'Cache not Found!', code: 1);
    }
  }

  @override
  Future<bool> isCached() async {
    return preferences.getString(cacheKey) != null;
  }

  @override
  Future<bool> saveCache(AppTheme data) async {
    try {
      await preferences.setString(cacheKey, data.toText());
      return true;
    } catch (err) {
      throw const CacheException(message: "Can't save cache", code: 1);
    }
  }
}
