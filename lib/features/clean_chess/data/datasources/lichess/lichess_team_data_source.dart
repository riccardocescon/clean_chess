import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/chess/utilities/extensions.dart';
import 'package:cleanchess/core/utilities/mixins/access_token_provider.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/remote_team_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class LichessTeamDataSource implements RemoteTeamDataSource {
  final LichessTokenProvider _tokenProvider;

  LichessTeamDataSource(this._tokenProvider);

  /// Api call to get all teams for a user by its id
  @override
  Future<Either<Failure, List<Team>>> getTeamsByUser(String userId) async {
    try {
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.teams.getByUser(username: userId);
      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// Api call to get team by team id
  @override
  Future<Either<Failure, Team>> getTeamById(String teamId) async {
    try {
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.teams.getById(teamId);
      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }
}
