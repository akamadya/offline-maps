
abstract class CacheDataSource<T> {
  /// Method to save cache data
  Future<bool> saveCache(T data);

  /// Get main data in local storage
  Future<T> getData();

  // Get status cache
  Future<bool> isCached();

  /// Clear cache from storage
  Future<bool> clearCache();

  /// Cache key, must be unique
  late String cacheKey;
}
