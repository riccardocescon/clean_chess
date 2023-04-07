import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/utilities/debug.dart';
import 'package:cleanchess/core/utilities/mixins/access_token_provider.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/remote_social_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';
import 'package:cleanchess/core/utilities/extentions.dart';

class LichessSocialDataSource implements RemoteSocialDataSource {
  final LichessTokenProvider _tokenProvider;

  LichessSocialDataSource(this._tokenProvider);

  /// Api call to get the Following users
  @override
  Future<Either<Failure, List<User>>> getFollowingUsers() async {
    try {
      logDebug(
        'Getting following users...',
        tag: 'Social',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;

      final response = await client.social.getFollowing();

      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// Api call for following a user
  @override
  Future<Either<Failure, bool>> followUser(String username) async {
    try {
      logDebug(
        'Following user...',
        tag: 'Social',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      await client.social.followUser(username: username);

      return const Right(true);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// Api call for unfollowing a user
  @override
  Future<Either<Failure, bool>> unfollowUser(String username) async {
    try {
      logDebug(
        'Unfollowing user...',
        tag: 'Social',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      await client.social.unfollowUser(username: username);

      return const Right(true);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }
}
