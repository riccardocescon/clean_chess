import 'package:clean_chess/core/error/failures.dart';
import 'package:clean_chess/core/usecases/usecase.dart';
import 'package:clean_chess/features/clean_chess/data/models/square.dart';
import 'package:clean_chess/features/clean_chess/domain/entities/piece_selected_params.dart';
import 'package:clean_chess/features/clean_chess/domain/repositories/board_repository.dart';
import 'package:clean_chess/features/clean_chess/presentation/bloc/board_event.dart';
import 'package:dartz/dartz.dart';

class PieceSelected extends UseCase<Iterable<Square>, PieceSelectedParams> {
  final BoardRepository repository;

  PieceSelected(this.repository);

  @override
  Future<Either<Failure, Iterable<Square>>> call(
    PieceSelectedParams params,
  ) async =>
      repository.pieceSelected(params);
}
