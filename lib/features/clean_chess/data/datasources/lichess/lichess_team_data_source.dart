import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/chess/utilities/extensions.dart';
import 'package:cleanchess/chess/utilities/utils.dart';
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

  /// Api call to get team team members by team id
  @override
  Future<Either<Failure, List<User>>> getTeamMembersByTeamId(
    String teamId,
  ) async {
    try {
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.teams.getMembers(teamId: teamId);

      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// Api call to get a list of the Join Requests for a team
  @override
  Future<Either<Failure, List<JoinRequest>>> getJoinRequestsByTeamId(
    String teamId,
  ) async {
    try {
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.teams.getJoinRequests(teamId: teamId);

      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// Api call to Accept a Join Request for a team
  /// [teamId] is the id of the team
  /// [userId] is the id of the user
  @override
  Future<Either<Failure, Empty>> acceptJoinRequest(
    String teamId,
    String userId,
  ) async {
    try {
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      await client.teams.acceptJoinRequest(
        teamId: teamId,
        userId: userId,
      );

      return const Right(Empty());
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// Api call to Decline a Join Request for a team
  /// [teamId] is the id of the team
  /// [userId] is the id of the user
  @override
  Future<Either<Failure, Empty>> declineJoinRequest(
    String teamId,
    String userId,
  ) async {
    try {
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      await client.teams.declineJoinRequest(
        teamId: teamId,
        userId: userId,
      );

      return const Right(Empty());
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// Api call to Kick a user from a team
  /// [teamId] is the id of the team
  /// [userId] is the id of the user
  @override
  Future<Either<Failure, Empty>> kickUserFromTeam(
    String teamId,
    String userId,
  ) async {
    try {
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      await client.teams.kickMember(
        teamId: teamId,
        userId: userId,
      );

      return const Right(Empty());
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }
}
