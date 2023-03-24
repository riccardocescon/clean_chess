import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/data/repositories/lichess/lichess_team_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class GetTeamsByUser extends UseCase<List<Team>, String> {
  final LichessTeamRepository _teamRepository;

  GetTeamsByUser(this._teamRepository);

  @override
  Future<Either<Failure, List<Team>>> call(String params) async {
    return await _teamRepository.getTeamsByUser(params);
  }
}
