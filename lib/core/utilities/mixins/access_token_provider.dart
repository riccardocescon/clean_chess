import 'package:cleanchess/core/utilities/secure_storage_helper.dart'
    as secure_storage_helper;

mixin AccessTokenProvider {
  /// Runtime cache of the access token
  /// to avoid unnecessary calls to the secure storage
  String? _accessToken;

  /// Save the access token to the secure storage
  /// and to the runtime cache for future use
  Future<void> saveAccessToken(String accessToken) async {
    await secure_storage_helper.saveTimedAccessToken(accessToken);
    _accessToken = accessToken;
  }

  /// Get the access token from the runtime cache
  /// or from the secure storage if the cache is empty
  Future<String?> get accessToken async =>
      _accessToken ??= await secure_storage_helper.getTimedAccessToken();
}
