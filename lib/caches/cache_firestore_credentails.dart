import 'dart:convert';

import 'package:firedart/firedart.dart';
import 'package:hostels/caches/cache_with_session_storage.dart';

class CachedTokenStore extends TokenStore {
  // mobile

  static const _id = "1044dd90-1559-45a7-a8c2-b11f189b36f6";

  static final _cache = CacheWithSessionStorage<String>(_id);

  static String get data => _cache.get() ?? "";

  static set data(String v) => _cache.set(v);

  @override
  Token? read() {
    try {
      final str = _cache.get();

      if (str == null) return null;

      final map = jsonDecode(str);

      return Token.fromMap(map);
    } catch (e) {
      //...
    }
    return null;
  }

  @override
  void write(Token? token) {
    if (token == null) return;

    final map = token.toMap();

    final str = jsonEncode(map);

    _cache.set(str);
  }

  @override
  void delete() {
    _cache.del();
  }
}
