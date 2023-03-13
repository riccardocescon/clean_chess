import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/chess/utilities/extensions.dart';
import 'package:cleanchess/core/utilities/mixins/access_token_provider.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/remote_user_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class LichessUserDataSource implements RemoteUserDataSource {
  final LichessTokenProvider _tokenProvider;

  LichessUserDataSource(this._tokenProvider);

  /// Api to get a list of users by a search term
  /// [term] is the search term
  /// [friend] is a boolean to search for friends only
  @override
  Future<Either<Failure, List<User>>> searchUsersByTerm(
    String term,
    bool friend,
  ) async {
    try {
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.users.searchByTerm(
        term: term,
        friend: friend,
      );

      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// Api to get a list of usernames by a search term
  /// [term] is the search term
  /// [friend] is a boolean to search for friends only
  @override
  Future<Either<Failure, List<String>>> searchNamesByTerm(
    String term,
    bool friend,
  ) async {
    try {
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.users.searchNamesByTerm(
        term: term,
        friend: friend,
      );

      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// Api to get a list of the Realtime User Stats
  @override
  Future<Either<Failure, List<RealTimeUserStatus>>> getRealtimeStatus(
    List<String> ids,
    bool withGameIds,
  ) async {
    try {
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.users.getRealTimeStatus(
        ids: ids,
        withGameIds: withGameIds,
      );

      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// Api to get the top 10 players for each speed and variant
  @override
  Future<Either<Failure, Map<String, List<User>>>> getTop10Players() async {
    try {
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.users.getTop10();

      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// Api to get the leaderboard for a single speed or variant (a.k.a. perfType)
  /// There is no leaderboard for correspondence or puzzles.
  /// [perfType] is the speed or variant to get the leaderboard for
  /// [nb] is the number of players to get
  @override
  Future<Either<Failure, List<User>>> getChessVariantLeaderboard(
    PerfType perfType,
    int nb,
  ) async {
    try {
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.users.getPerfTypeLeaderboard(
        perfType: perfType,
        nb: nb,
      );

      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// Api to read public data of a user.
  /// If the request is authenticated with OAuth2, then
  /// extra fields might be present in the response:
  /// followable, following, blocking, followsYou
  @override
  Future<Either<Failure, User>> getPublicData({
    required String username,
    bool trophies = false,
  }) async {
    try {
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.users.getPublicData(
        username: username,
        trophies: trophies,
      );

      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// Read rating history of a user, for all perf types.
  /// There is at most one entry per day
  /// Format of an entry is [year, month, day, rating]
  /// Month starts at zero (January).
  @override
  Future<Either<Failure, List<RatingHistory>>> getRatingHistory(
    String username,
  ) async {
    try {
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.users.getRatingHistory(
        username: username,
      );

      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }
}
