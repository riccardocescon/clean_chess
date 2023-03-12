import 'package:cleanchess/chess/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

abstract class TeamRepository {
  Future<Either<Failure, List<Team>>> getTeamsByUser(String username);

  Future<Either<Failure, Team>> getTeamById(String teamId);
}
