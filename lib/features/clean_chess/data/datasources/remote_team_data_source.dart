import 'package:cleanchess/chess/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

abstract class RemoteTeamDataSource {
  /// Api call to get all teams for a user by its id
  Future<Either<Failure, List<Team>>> getTeamsByUser(String userId);

  /// Api call to get team by team id
  Future<Either<Failure, Team>> getTeamById(String teamId);
}
