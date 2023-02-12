import 'package:clean_chess/core/error/failures.dart';
import 'package:clean_chess/core/usecases/usecase.dart';
import 'package:clean_chess/features/clean_chess/domain/repositories/board_repository.dart';
import 'package:clean_chess/features/clean_chess/presentation/bloc/board_event.dart';
import 'package:dartz/dartz.dart';

class PieceMove extends UseCase<void, PieceMoveEvent> {
  final BoardRepository repository;

  PieceMove(this.repository);

  @override
  Future<Either<Failure, void>> call(PieceMoveEvent params) async =>
      repository.pieceMove(params);
}
