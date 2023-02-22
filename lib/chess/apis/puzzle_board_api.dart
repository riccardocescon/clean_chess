import 'package:clean_chess/chess/abstractions/iboard_api.dart';
import 'package:clean_chess/chess/models/cell.dart';
import 'package:clean_chess/chess/abstractions/piece.dart';
import 'package:clean_chess/chess/models/fen.dart';
import 'package:clean_chess/chess/models/pieces.dart';
import 'package:clean_chess/core/utilities/enums.dart';
import 'package:clean_chess/core/utilities/extensions.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_chess/chess/utilities/utils.dart';
import 'package:clean_chess/chess/models/move.dart';
import 'package:clean_chess/chess/models/board.dart';
import 'package:clean_chess/chess/error/failures.dart';

class PuzzleBoardAPI extends IBoardAPI {
  // Singleton
  PuzzleBoardAPI._privateConstructor();
  static final PuzzleBoardAPI _instance = PuzzleBoardAPI._privateConstructor();
  factory PuzzleBoardAPI() {
    return _instance;
  }

  @override
  Board board = Board.empty();

  @override
  Either<Failure, Board> fromFen(Fen fen) {
    try {
      board = Board.fromFen(fen);
      return Right(board);
    } catch (e) {
      return Left(InvalidFen());
    }
  }

  @override
  Fen getFen() => Fen(board.toFen(), PieceColor.white);

  @override
  Either<Failure, Empty> move(Move move) {
    // TODO: implement move
    throw UnimplementedError();
  }

  @override
  Either<Failure, Move> nextMove() {
    // TODO: implement nextMove
    throw UnimplementedError();
  }

  @override
  Either<Failure, Move> previousMove() {
    // TODO: implement previousMove
    throw UnimplementedError();
  }

  @override
  Either<Failure, Iterable<Cell>> planPath(Piece piece) {
    final cell = board.cells.firstWhereOrNull((e) => e.piece == piece);
    if (cell == null) {
      return Left(
        PieceNotFoundOnCellFailure("Piece not found on any cell on board"),
      );
    }
    return board.planPath(cell);
  }
}
