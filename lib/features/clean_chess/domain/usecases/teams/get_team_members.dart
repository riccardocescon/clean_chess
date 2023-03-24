import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/data/repositories/lichess/lichess_team_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class GetTeamMembers extends UseCase<List<User>, GetTeamMembersParams> {
  final LichessTeamRepository repository;

  GetTeamMembers(this.repository);

  @override
  Future<Either<Failure, List<User>>> call(GetTeamMembersParams params) async {
    return await repository.getTeamMembersEvent(
      params.teamId,
      params.maxMembers,
    );
  }
}

class GetTeamMembersParams {
  final String teamId;
  final int maxMembers;

  GetTeamMembersParams(this.teamId, this.maxMembers);
}
