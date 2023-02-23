import 'package:clean_chess/chess/abstractions/iboard_api.dart';
import 'package:clean_chess/chess/models/cell.dart';
import 'package:clean_chess/chess/abstractions/piece.dart';
import 'package:clean_chess/chess/models/fen.dart';
import 'package:clean_chess/chess/utilities/extensions.dart';
import 'package:clean_chess/core/utilities/enums.dart';
import 'package:clean_chess/core/utilities/extensions.dart';
import 'package:dartz/dartz.dart';
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

  PieceColor _currentPlayerTurn = PieceColor.white;

  int _currentMoveIndex = 0;

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
  Either<Failure, Board> move(Move move) {
    if (_currentMoveIndex != board.totalMoves) {
      return Left(CannotMoveOnPreviousMoveFailure());
    }
    final result = board.movePiece(move);
    if (result.isLeft()) return Left(result.left);
    _invertTurn();
    _currentMoveIndex++;
    return Right(Board.clone(board));
  }

  @override
  Either<Failure, Board> nextMove() {
    if (_currentMoveIndex == board.totalMoves) return Left(NoNextMoveFailure());
    final result = board.getMove(_currentMoveIndex + 1);
    if (result.isLeft()) return Left(result.left);
    _currentMoveIndex++;
    _invertTurn();
    return Right(Board.fromFen(Fen.fromRaw(result.right)));
  }

  @override
  Either<Failure, Board> previousMove() {
    if (_currentMoveIndex == 0) return Left(NoPreviousMoveFailure());
    final result = board.getMove(_currentMoveIndex - 1);
    if (result.isLeft()) return Left(result.left);
    _currentMoveIndex--;
    _invertTurn();
    return Right(Board.fromFen(Fen.fromRaw(result.right)));
  }

  @override
  Either<Failure, Iterable<Cell>> planPath(Cell cell) {
    if (_currentMoveIndex != board.totalMoves) {
      return Left(CannotMoveOnPreviousMoveFailure());
    }

    final boardCell =
        board.cells.firstWhereOrNull((e) => e.coord == cell.coord);
    if (boardCell == null) {
      return Left(PieceNotFoundOnCellFailure("Piece not found on cell $cell"));
    }

    final piece = boardCell.piece as Piece;

    if (piece.color != _currentPlayerTurn) {
      return Left(InvalidPlayerTurnFailure());
    }

    return board.planPath(boardCell);
  }

  void _invertTurn() {
    _currentPlayerTurn = _currentPlayerTurn == PieceColor.white
        ? PieceColor.black
        : PieceColor.white;
  }
}
