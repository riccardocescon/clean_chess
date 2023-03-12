import 'package:cleanchess/chess/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

abstract class RemoteTeamDataSource {
  Future<Either<Failure, List<Team>>> getTeamsByUser(String userId);
}
