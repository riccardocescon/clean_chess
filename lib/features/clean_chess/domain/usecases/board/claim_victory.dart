import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/core/utilities/empty.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/board_repository.dart';
import 'package:dartz/dartz.dart';

class ClaimVictory extends UseCase<Empty, String> {
  final BoardRepository repository;

  ClaimVictory(this.repository);

  @override
  Future<Either<Failure, Empty>> call(String params) async {
    return await repository.claimVictory(params);
  }
}
