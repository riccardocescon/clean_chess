import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/core/utilities/empty.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/team_repository.dart';
import 'package:dartz/dartz.dart';

class MessageAllMembers extends UseCase<Empty, MessageAllMembersParams> {
  final TeamRepository repository;

  MessageAllMembers(this.repository);

  @override
  Future<Either<Failure, Empty>> call(MessageAllMembersParams params) =>
      repository.messageAllMembers(params.teamId, params.message);
}

class MessageAllMembersParams {
  final String teamId;
  final String message;

  MessageAllMembersParams(this.teamId, this.message);
}
