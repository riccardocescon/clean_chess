import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/team_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class GetTeamJoinRequests extends UseCase<List<JoinRequest>, String> {
  final TeamRepository repository;

  GetTeamJoinRequests(this.repository);

  @override
  Future<Either<Failure, List<JoinRequest>>> call(String params) async {
    return await repository.getJoinRequestsByTeamId(params);
  }
}
