import 'package:cleanchess/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

abstract class RemoteUserDataSource {
  /// Api to get a list of users by a search term
  /// [term] is the search term
  /// [friend] is a boolean to search for friends only
  Future<Either<Failure, List<User>>> searchUsersByTerm(
    String term,
    bool friend,
  );

  /// Api to get a list of usernames by a search term
  /// [term] is the search term
  /// [friend] is a boolean to search for friends only
  Future<Either<Failure, List<String>>> searchNamesByTerm(
    String term,
    bool friend,
  );

  /// Api to get a list of the Realtime User Stats
  Future<Either<Failure, List<RealTimeUserStatus>>> getRealtimeStatus(
    List<String> ids,
    bool withGameIds,
  );

  /// Api to get the top 10 players for each speed and variant
  Future<Either<Failure, Map<String, List<User>>>> getTop10Players();

  /// Api to get the leaderboard for a single speed or variant (a.k.a. perfType)
  /// There is no leaderboard for correspondence or puzzles.
  /// [perfType] is the speed or variant to get the leaderboard for
  /// [nb] is the number of players to get
  Future<Either<Failure, List<User>>> getChessVariantLeaderboard(
    PerfType perfType,
    int nb,
  );

  /// Api to read public data of a user.
  /// If the request is authenticated with OAuth2, then
  /// extra fields might be present in the response:
  /// followable, following, blocking, followsYou
  Future<Either<Failure, User>> getPublicData({
    required String username,
    bool trophies = false,
  });

  /// Api to read rating history of a user, for all perf types.
  /// There is at most one entry per day
  /// Format of an entry is [year, month, day, rating]
  /// Month starts at zero (January).
  Future<Either<Failure, List<RatingHistory>>> getRatingHistory(
    String username,
  );

  /// Api to get up to 300 users by their IDs. Users are returned in the same order as the IDs.
  /// The method is POST to allow a longer list of IDs to be sent in the request body.
  /// Please do not try to download all the Lichess users with this endpoint,
  /// or any other endpoint. An API is not a way to fully export a website.
  /// We do not provide a full download of the Lichess users.
  /// This endpoint is limited to 8,000 users every 10 minutes, and 120,000 every day.
  Future<Either<Failure, List<User>>> getManyByIds(List<String> ids);

  /// Api to get basic info about currently streaming users.
  /// This API is very fast and cheap on lichess side.
  /// So you can call it quite often (like once every 5 seconds)
  Future<Either<Failure, List<User>>> getLiveStreamers();
}
