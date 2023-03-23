import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/core/utilities/empty.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/team_repository.dart';
import 'package:dartz/dartz.dart';

class LeaveTeam extends UseCase<Empty, String> {
  final TeamRepository repository;

  LeaveTeam(this.repository);

  @override
  Future<Either<Failure, Empty>> call(String params) =>
      repository.leaveTeam(params);
}
