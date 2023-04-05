import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/utilities/debug.dart';
import 'package:cleanchess/core/utilities/empty.dart';
import 'package:cleanchess/core/utilities/mixins/access_token_provider.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/remote_team_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';
import 'package:cleanchess/core/utilities/extentions.dart';

class LichessTeamDataSource implements RemoteTeamDataSource {
  final LichessTokenProvider _tokenProvider;

  LichessTeamDataSource(this._tokenProvider);

  /// Api call to get all teams for a user by its id
  @override
  Future<Either<Failure, List<Team>>> getTeamsByUser(String userId) async {
    try {
      logDebug(
        'Getting Teams by userId...',
        tag: 'Team',
        color: LogColor.lightBlue,
      );
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
      logDebug(
        'Getting Team by teamId...',
        tag: 'Team',
        color: LogColor.lightBlue,
      );
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
    int maxMembers,
  ) async {
    try {
      logDebug(
        'Getting Team Members by teamId...',
        tag: 'Team',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.teams
          .getMembers(teamId: teamId)
          .take(maxMembers)
          .toList();

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
      logDebug(
        'Getting Join Requests by teamId...',
        tag: 'Team',
        color: LogColor.lightBlue,
      );
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
      logDebug(
        'Accepting Join Request by teamId...',
        tag: 'Team',
        color: LogColor.lightBlue,
      );
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
      logDebug(
        'Declining Join Request by teamId...',
        tag: 'Team',
        color: LogColor.lightBlue,
      );
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
      logDebug(
        'Kicking User from Team by teamId...',
        tag: 'Team',
        color: LogColor.lightBlue,
      );
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

  /// Api call join a team
  /// [teamId] is the id of the team
  /// [message] is the message to send to the team
  /// [password] is the password of the team
  @override
  Future<Either<Failure, Empty>> joinTeam(
    String teamId,
    String? message,
    String? password,
  ) async {
    try {
      logDebug(
        'Joining Team by teamId...',
        tag: 'Team',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      await client.teams.join(
        teamId: teamId,
        message: message,
        password: password,
      );

      return const Right(Empty());
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// Api call to leave a team
  @override
  Future<Either<Failure, Empty>> leaveTeam(String teamId) async {
    try {
      logDebug(
        'Leaving Team by teamId...',
        tag: 'Team',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      await client.teams.leave(teamId: teamId);

      return const Right(Empty());
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// Api for sending a message to all members of a team
  @override
  Future<Either<Failure, Empty>> messageAllMembers(
    String teamId,
    String message,
  ) async {
    try {
      logDebug(
        'Sending Message to all members of a team...',
        tag: 'Team',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      await client.teams.messageAllMembers(
        teamId: teamId,
        message: message,
      );

      return const Right(Empty());
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// Api for searching a team by name
  @override
  Future<Either<Failure, PageOf<Team>>> searchTeamByName(
      String name, int page) async {
    try {
      logDebug(
        'Searching Team by name...',
        tag: 'Team',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.teams.search(text: name, page: page);

      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// Api for getting popular teams
  @override
  Future<Either<Failure, PageOf<Team>>> getPopularTeams(int page) async {
    try {
      logDebug(
        'Getting Popular Teams...',
        tag: 'Team',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.teams.getPopular(page: page);

      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }
}
