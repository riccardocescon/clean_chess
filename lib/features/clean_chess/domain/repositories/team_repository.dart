import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/chess/utilities/utils.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

abstract class TeamRepository {
  Future<Either<Failure, List<Team>>> getTeamsByUser(String username);

  Future<Either<Failure, Team>> getTeamById(String teamId);

  Future<Either<Failure, List<User>>> getTeamMembersEvent(String teamId);

  Future<Either<Failure, List<JoinRequest>>> getJoinRequestsByTeamId(
    String teamId,
  );

  Future<Either<Failure, Empty>> acceptJoinRequest(
    String teamId,
    String userId,
  );

  Future<Either<Failure, Empty>> kickUserFromTeam(
    String teamId,
    String userId,
  );
}
