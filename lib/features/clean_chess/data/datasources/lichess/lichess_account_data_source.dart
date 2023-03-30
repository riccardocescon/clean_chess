import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/utilities/debug.dart';
import 'package:cleanchess/core/utilities/empty.dart';
import 'package:cleanchess/core/utilities/extentions.dart';
import 'package:cleanchess/core/utilities/mixins/access_token_provider.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/remote_account_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

/// This class is responsible for making API calls to Lichess
/// and returning the response to the [NetRepositoryImpl]
///
/// This class is not resposible for any business logic
class LichessAccountDataSource implements RemoteAccountDataSource {
  final LichessTokenProvider _tokenProvider;

  const LichessAccountDataSource(this._tokenProvider);

  /// API request to get user profile
  @override
  Future<Either<Failure, User>> getMyUserProfile() async {
    try {
      logDebug('Getting user profile...',
          tag: 'Account', color: LogColor.lightBlue);
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.account.getProfile();
      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// API request to get user email
  /// This is a separate API call because the email is not returned
  /// in the user profile API call
  @override
  Future<Either<Failure, String>> getMyUserEmail() async {
    try {
      logDebug('Getting user email...',
          tag: 'Account', color: LogColor.lightBlue);
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.account.getEmailAddress();
      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// API request to get user kid mode status
  /// This is a separate API call because the kid mode status is not returned
  /// in the user profile API call
  @override
  Future<Either<Failure, bool>> getMyKidModeStatus() async {
    try {
      logDebug(
        'Getting user kid mode status...',
        tag: 'Account',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.account.getKidModeStatus();
      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// API request to set user kid mode status
  @override
  Future<Either<Failure, Empty>> setMyKidModeStatus({
    required bool status,
  }) async {
    try {
      logDebug(
        'Setting user kid mode status to $status...',
        tag: 'Account',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      await client.account.setMyKidModeStatus(enableKidMode: status);
      return const Right(Empty());
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// API request to get user preferences
  /// This is a separate API call because the preferences are not returned
  /// in the user profile API call
  @override
  Future<Either<Failure, UserPreferences>> getMyPreferences() async {
    try {
      logDebug(
        'Getting user preferences...',
        tag: 'Account',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;

      final response = await client.account.getMyPreferences();
      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }
}
