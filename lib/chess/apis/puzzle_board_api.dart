import 'package:cleanchess/chess/abstractions/iboard_api.dart';
import 'package:cleanchess/chess/models/cell.dart';
import 'package:cleanchess/chess/abstractions/piece.dart';
import 'package:cleanchess/chess/models/fen.dart';
import 'package:cleanchess/chess/models/pieces.dart';
import 'package:cleanchess/chess/models/tuple.dart';
import 'package:cleanchess/chess/utilities/extensions.dart';
import 'package:cleanchess/chess/core/utilities/enums.dart';
import 'package:cleanchess/chess/core/utilities/extensions.dart';
import 'package:dartz/dartz.dart';
import 'package:cleanchess/chess/models/move.dart';
import 'package:cleanchess/chess/models/board.dart';
import 'package:cleanchess/chess/error/failures.dart';

/// This class is used to manage the board state for a puzzle.
/// It is a singleton, so it can be accessed from anywhere in the app.
///
/// This class holds the current state of the board.
/// The [board] property can be accessed only from this class.
/// All API calls that return a [Board] will return a clone of the current board.
///
/// All API calls MUST return an Either<Failure, dynamic>.
class PuzzleBoardAPI extends IBoardAPI {
  // Singleton
  PuzzleBoardAPI._privateConstructor();
  static final PuzzleBoardAPI _instance = PuzzleBoardAPI._privateConstructor();
  factory PuzzleBoardAPI() {
    return _instance;
  }

  /// The player whose turn it is
  PieceColor _currentPlayerTurn = PieceColor.white;

  /// Index of the current on-screen move
  ///
  /// This is used to show previous moves on the board
  /// and to prevent the user from making a move on a previous move.
  int _currentMoveIndex = 0;

  @override
  Either<Failure, Board> fromFen(Fen fen) {
    try {
      board = Board.fromFen(fen);
      _currentPlayerTurn = fen.turn;
      _currentMoveIndex = 0;
      return Right(board);
    } catch (e) {
      return Left(InvalidFen());
    }
  }

  @override
  Either<Failure, Fen> getFen() {
    final fen = board.positionsFen(_currentPlayerTurn);
    if (fen.isLeft()) return Left(fen.left);

    return Right(Fen.fromRaw(fen.right));
  }

  @override
  Future<Either<Failure, Board>> move(
    Move move, {
    required Future<Piece> Function() onPawnPromotion,
  }) async {
    if (_currentMoveIndex != board.totalKnownMoves) {
      return Left(CannotMoveOnPreviousMoveFailure());
    }
    final result = await board.movePiece(move, onPawnPromotion);
    if (result.isLeft()) return Left(result.left);
    _invertTurn();
    _currentMoveIndex++;
    return Right(Board.clone(board));
  }

  @override
  Either<Failure, Tuple<Board, Move?>> nextMove() {
    if (_currentMoveIndex == board.totalKnownMoves) {
      return Left(NoNextMoveFailure());
    }
    final result = board.getMove(_currentMoveIndex + 1);
    if (result.isLeft()) return Left(result.left);
    _currentMoveIndex++;
    _invertTurn();
    final fenString = result.right.first;
    final lastMove = result.right.second;
    final response = Tuple(Board.fromFen(Fen.fromRaw(fenString)), lastMove);
    return Right(response);
  }

  @override
  Either<Failure, Tuple<Board, Move?>> previousMove() {
    if (_currentMoveIndex == 0) return Left(NoPreviousMoveFailure());
    final result = board.getMove(_currentMoveIndex - 1);
    if (result.isLeft()) return Left(result.left);
    _currentMoveIndex--;
    _invertTurn();
    final fenString = result.right.first;
    final lastMove = result.right.second;
    final response = Tuple(Board.fromFen(Fen.fromRaw(fenString)), lastMove);
    return Right(response);
  }

  @override
  Future<Either<Failure, Iterable<Cell>>> planPath(Cell cell) async {
    if (_currentMoveIndex != board.totalKnownMoves) {
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

    return await board.planPath(boardCell);
  }

  void _invertTurn() {
    _currentPlayerTurn = _currentPlayerTurn == PieceColor.white
        ? PieceColor.black
        : PieceColor.white;
  }

  @override
  Iterable<Tuple<Piece, int>> getKingThreats(
    PieceColor color,
  ) {
    final threats = color == PieceColor.white
        ? board.whiteKingThreats
        : board.blackKingThreats;

    return threats.map((e) => Tuple(e.first.piece!, e.second));
  }
}
