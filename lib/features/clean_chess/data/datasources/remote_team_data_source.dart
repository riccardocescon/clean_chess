import 'package:cleanchess/chess/error/failures.dart';
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
  );

  /// Api call to get a list of the Join Requests for a team
  Future<Either<Failure, List<JoinRequest>>> getJoinRequestsByTeamId(
    String teamId,
  );
}
