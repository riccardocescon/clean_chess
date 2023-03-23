import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/core/utilities/empty.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/team_repository.dart';
import 'package:dartz/dartz.dart';

class KickMemberFromTeam extends UseCase<Empty, KickMemberFromTeamParams> {
  final TeamRepository repository;

  KickMemberFromTeam(this.repository);

  @override
  Future<Either<Failure, Empty>> call(KickMemberFromTeamParams params) =>
      repository.kickUserFromTeam(params.teamId, params.userId);
}

class KickMemberFromTeamParams {
  final String teamId;
  final String userId;

  KickMemberFromTeamParams(this.teamId, this.userId);
}
