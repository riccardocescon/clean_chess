import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/utilities/debug.dart';
import 'package:cleanchess/core/utilities/mixins/access_token_provider.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/remote_user_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';
import 'package:cleanchess/core/utilities/extentions.dart';

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
      logDebug(
        'Searching users by term...',
        tag: 'User',
        color: LogColor.lightBlue,
      );
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
      logDebug(
        'Searching names by term...',
        tag: 'User',
        color: LogColor.lightBlue,
      );
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
      logDebug(
        'Getting realtime status...',
        tag: 'User',
        color: LogColor.lightBlue,
      );
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
      logDebug(
        'Getting top 10 players...',
        tag: 'User',
        color: LogColor.lightBlue,
      );
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
      logDebug(
        'Getting leaderboard for $perfType...',
        tag: 'User',
        color: LogColor.lightBlue,
      );
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
      logDebug(
        'Getting public data for $username...',
        tag: 'User',
        color: LogColor.lightBlue,
      );
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
      logDebug(
        'Getting rating history for $username...',
        tag: 'User',
        color: LogColor.lightBlue,
      );
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

  /// Api to get up to 300 users by their IDs. Users are returned in the same order as the IDs.
  /// The method is POST to allow a longer list of IDs to be sent in the request body.
  /// Please do not try to download all the Lichess users with this endpoint,
  /// or any other endpoint. An API is not a way to fully export a website.
  /// We do not provide a full download of the Lichess users.
  /// This endpoint is limited to 8,000 users every 10 minutes, and 120,000 every day.
  @override
  Future<Either<Failure, List<User>>> getManyByIds(List<String> ids) async {
    try {
      logDebug(
        'Getting users by ids...',
        tag: 'User',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.users.getManyById(ids: ids);

      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// Api to get basic info about currently streaming users.
  /// This API is very fast and cheap on lichess side.
  /// So you can call it quite often (like once every 5 seconds)
  @override
  Future<Either<Failure, List<User>>> getLiveStreamers() async {
    try {
      logDebug(
        'Getting live streamers...',
        tag: 'User',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.users.getLiveStreamers();

      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }
}
