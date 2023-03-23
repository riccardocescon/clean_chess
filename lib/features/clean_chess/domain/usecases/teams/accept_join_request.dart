import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/core/utilities/empty.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/team_repository.dart';
import 'package:dartz/dartz.dart';

class AcceptJoinRequest extends UseCase<Empty, AcceptJoinRequestParams> {
  final TeamRepository repository;

  AcceptJoinRequest(this.repository);

  @override
  Future<Either<Failure, Empty>> call(AcceptJoinRequestParams params) async {
    return await repository.acceptJoinRequest(params.teamId, params.requestId);
  }
}

class AcceptJoinRequestParams {
  final String teamId;
  final String requestId;

  AcceptJoinRequestParams(this.teamId, this.requestId);
}
