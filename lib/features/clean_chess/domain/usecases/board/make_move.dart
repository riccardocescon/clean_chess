import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/core/utilities/empty.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/board_repository.dart';
import 'package:dartz/dartz.dart';

class MakeMove extends UseCase<Empty, MakeMoveParams> {
  final BoardRepository repository;

  MakeMove(this.repository);

  @override
  Future<Either<Failure, Empty>> call(MakeMoveParams params) async {
    return await repository.makeMove(
      gameId: params.gameId,
      move: params.move,
      offeringDraw: params.offeringDraw,
    );
  }
}

class MakeMoveParams {
  final String gameId;
  final String move;
  final bool? offeringDraw;

  MakeMoveParams({
    required this.gameId,
    required this.move,
    this.offeringDraw,
  });
}
