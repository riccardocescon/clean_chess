import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/utilities/empty.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

abstract class TeamRepository {
  Future<Either<Failure, List<Team>>> getTeamsByUser(String username);

  Future<Either<Failure, Team>> getTeamById(String teamId);

  Future<Either<Failure, List<User>>> getTeamMembersEvent(
    String teamId,
    int maxMembers,
  );

  Future<Either<Failure, List<JoinRequest>>> getJoinRequestsByTeamId(
    String teamId,
  );

  Future<Either<Failure, Empty>> acceptJoinRequest(
    String teamId,
    String userId,
  );

  Future<Either<Failure, Empty>> declineJoinRequest(
    String teamId,
    String userId,
  );

  Future<Either<Failure, Empty>> kickUserFromTeam(
    String teamId,
    String userId,
  );

  Future<Either<Failure, Empty>> joinTeam(
    String teamId,
    String? message,
    String? password,
  );

  Future<Either<Failure, Empty>> leaveTeam(String teamId);

  Future<Either<Failure, Empty>> messageAllMembers(
    String teamId,
    String message,
  );

  Future<Either<Failure, PageOf<Team>>> searchTeamByName(
    String name,
    int page,
  );

  Future<Either<Failure, PageOf<Team>>> getPopularTeams(int page);
}
