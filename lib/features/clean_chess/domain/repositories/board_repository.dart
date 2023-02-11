import 'package:clean_chess/core/error/failures.dart';
import 'package:clean_chess/features/clean_chess/data/models/board.dart';
import 'package:clean_chess/features/clean_chess/data/models/square.dart';
import 'package:clean_chess/features/clean_chess/domain/entities/piece_selected_params.dart';
import 'package:dartz/dartz.dart';

abstract class BoardRepository {
  Either<Failure, Iterable<Square>> pieceSelected(
    PieceSelectedParams params,
  );
}
