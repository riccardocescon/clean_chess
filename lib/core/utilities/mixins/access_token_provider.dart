import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/utilities/secure_storage_helper.dart'
    as secure_storage_helper;
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class LichessTokenProvider {
  /// Runtime cache of the access token
  /// to avoid unnecessary calls to the secure storage
  String? _accessToken;

  /// Runtime cache of the LichessClient
  /// to avoid unnecessary calls to the secure storage
  LichessClient? _client;

  /// Create a new LichessClient with the access token
  /// and save it to the runtime cache for future use
  void setClient() =>
      _client = LichessClientDio.create(accessToken: _accessToken);

  /// This getter MUST be called just for getting the access token
  /// in order to Revoke it!
  /// You do not have the need to call it in any other place
  String get accessToken => _accessToken!;

  /// Save the access token to the secure storage
  /// and to the runtime cache for future use
  Future<void> saveAccessToken(String accessToken) async {
    // Override the accessToken to the local storage
    await secure_storage_helper.saveTimedAccessToken(accessToken);

    // Override the accessToken to the runtime cache
    _accessToken = accessToken;

    // Kill the old client if it exists
    await _client?.close();

    // Create a new client with the new access token
    setClient();
  }

  /// Get the LichessClient
  /// If there is no access in runtime cache, try to get it from the secure storage
  /// If there is no access token in the secure storage, return a [NoAccessTokenFailure]
  Future<Either<Failure, LichessClient>> getClient() async {
    // If the client is already created, return it
    if (_client != null) return Right(_client!);

    // If the access token is already created, create the client and return it
    if (_accessToken != null) {
      setClient();
      return Right(_client!);
    }

    // If the access token is not created, try to get it from the secure storage
    final accessToken = await secure_storage_helper.getTimedAccessToken();

    // If there is no access token in the secure storage, return a [NoAccessTokenFailure]
    if (accessToken == null) return const Left(NoAccessTokenFailure());

    // If there is an access token in the secure storage, create the client and return it
    _accessToken = accessToken;
    setClient();
    return Right(_client!);
  }

  Future<void> revokeToken() async {
    _accessToken = null;
    _client = null;
    await secure_storage_helper.deleteTimedAccessToken();
  }
}
