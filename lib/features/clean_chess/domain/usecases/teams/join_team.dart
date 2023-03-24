import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/core/utilities/empty.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/team_repository.dart';
import 'package:dartz/dartz.dart';

class JoinTeam extends UseCase<Empty, JoinTeamParams> {
  final TeamRepository repository;

  JoinTeam(this.repository);

  @override
  Future<Either<Failure, Empty>> call(JoinTeamParams params) =>
      repository.joinTeam(params.teamId, params.message, params.passwrord);
}

class JoinTeamParams {
  final String teamId;
  final String? message;
  final String? passwrord;

  JoinTeamParams(this.teamId, {this.message, this.passwrord});
}
