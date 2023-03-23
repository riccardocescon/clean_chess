import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/core/utilities/empty.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/team_repository.dart';
import 'package:dartz/dartz.dart';

class DeclineJoinRequest extends UseCase<Empty, DeclineJoinRequestParams> {
  final TeamRepository repository;

  DeclineJoinRequest(this.repository);

  @override
  Future<Either<Failure, Empty>> call(DeclineJoinRequestParams params) =>
      repository.declineJoinRequest(params.teamId, params.userId);
}

class DeclineJoinRequestParams {
  final String teamId;
  final String userId;

  DeclineJoinRequestParams(this.teamId, this.userId);
}
