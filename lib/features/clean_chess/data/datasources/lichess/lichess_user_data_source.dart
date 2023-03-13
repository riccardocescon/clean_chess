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
  Future<Either<Failure, List<User>>> getUsersByTerm(
    String term,
    bool friend,
  ) async {
    try {
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.users.autocomplete(
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
  Future<Either<Failure, List<String>>> getUsernamesByTerm(
    String term,
    bool friend,
  ) async {
    try {
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.users.autocompleteUsernames(
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
}
