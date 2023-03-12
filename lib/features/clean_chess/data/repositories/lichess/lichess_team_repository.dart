import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/chess/utilities/utils.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/lichess/lichess_team_data_source.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/team_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class LichessTeamRepository implements TeamRepository {
  final LichessTeamDataSource teamDataSource;

  LichessTeamRepository({required this.teamDataSource});

  @override
  Future<Either<Failure, List<Team>>> getTeamsByUser(String username) =>
      teamDataSource.getTeamsByUser(username);

  @override
  Future<Either<Failure, Team>> getTeamById(String teamId) =>
      teamDataSource.getTeamById(teamId);

  @override
  Future<Either<Failure, List<User>>> getTeamMembersEvent(String teamId) =>
      teamDataSource.getTeamMembersByTeamId(teamId);

  @override
  Future<Either<Failure, List<JoinRequest>>> getJoinRequestsByTeamId(
    String teamId,
  ) =>
      teamDataSource.getJoinRequestsByTeamId(teamId);

  @override
  Future<Either<Failure, Empty>> acceptJoinRequest(
    String teamId,
    String userId,
  ) =>
      teamDataSource.acceptJoinRequest(teamId, userId);

  @override
  Future<Either<Failure, Empty>> declineJoinRequest(
    String teamId,
    String userId,
  ) =>
      teamDataSource.declineJoinRequest(teamId, userId);

  @override
  Future<Either<Failure, Empty>> kickUserFromTeam(
    String teamId,
    String userId,
  ) =>
      teamDataSource.kickUserFromTeam(teamId, userId);

  @override
  Future<Either<Failure, Empty>> joinTeam(
    String teamId,
    String? message,
    String? password,
  ) =>
      teamDataSource.joinTeam(teamId, message, password);

  @override
  Future<Either<Failure, Empty>> leaveTeam(String teamId) =>
      teamDataSource.leaveTeam(teamId);

  @override
  Future<Either<Failure, Empty>> messageAllMembers(
    String teamId,
    String message,
  ) =>
      teamDataSource.messageAllMembers(teamId, message);
}
