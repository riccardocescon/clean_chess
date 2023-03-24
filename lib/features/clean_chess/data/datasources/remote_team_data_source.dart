import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/utilities/empty.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

abstract class RemoteTeamDataSource {
  /// Api call to get all teams for a user by its id
  Future<Either<Failure, List<Team>>> getTeamsByUser(String userId);

  /// Api call to get team by team id
  Future<Either<Failure, Team>> getTeamById(String teamId);

  /// Api call to get team team members by team id
  Future<Either<Failure, List<User>>> getTeamMembersByTeamId(
    String teamId,
    int maxMembers,
  );

  /// Api call to get a list of the Join Requests for a team
  Future<Either<Failure, List<JoinRequest>>> getJoinRequestsByTeamId(
    String teamId,
  );

  /// Api call to Accept a Join Request for a team
  /// [teamId] is the id of the team
  /// [userId] is the id of the user
  Future<Either<Failure, Empty>> acceptJoinRequest(
    String teamId,
    String userId,
  );

  /// Api call to Decline a Join Request for a team
  /// [teamId] is the id of the team
  /// [userId] is the id of the user
  Future<Either<Failure, Empty>> declineJoinRequest(
    String teamId,
    String userId,
  );

  /// Api call to Kick a user from a team
  /// [teamId] is the id of the team
  /// [userId] is the id of the user
  Future<Either<Failure, Empty>> kickUserFromTeam(
    String teamId,
    String userId,
  );

  /// Api call to join a team
  /// [teamId] is the id of the team
  /// [message] is the message to send to the team if needed
  /// [password] is the password to join the team if needed
  Future<Either<Failure, Empty>> joinTeam(
    String teamId,
    String? message,
    String? password,
  );

  /// Api call to leave a team
  Future<Either<Failure, Empty>> leaveTeam(String teamId);

  /// Api for sending a message to all members of a team
  Future<Either<Failure, Empty>> messageAllMembers(
    String teamId,
    String message,
  );

  /// Api for searching a team by name
  Future<Either<Failure, PageOf<Team>>> searchTeamByName(String name, int page);

  /// Api for getting popular teams
  Future<Either<Failure, PageOf<Team>>> getPopularTeams(int page);
}
