import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/data/repositories/lichess/lichess_team_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class GetTeamById extends UseCase<Team, String> {
  final LichessTeamRepository _teamRepository;

  GetTeamById(this._teamRepository);

  @override
  Future<Either<Failure, Team>> call(String params) async {
    return await _teamRepository.getTeamById(params);
  }
}
