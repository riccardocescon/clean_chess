import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String _timedAccessToken = 'timed_access_token';

Future saveTimedAccessToken(String accessToken) async =>
    const FlutterSecureStorage()
        .write(key: _timedAccessToken, value: accessToken);

Future<String?> getTimedAccessToken() async =>
    const FlutterSecureStorage().read(key: _timedAccessToken);
