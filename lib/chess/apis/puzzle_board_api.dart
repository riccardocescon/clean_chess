import 'package:clean_chess/chess/abstractions/iboard_api.dart';
import 'package:clean_chess/chess/models/cell.dart';
import 'package:clean_chess/chess/abstractions/piece.dart';
import 'package:clean_chess/chess/models/fen.dart';
import 'package:clean_chess/chess/models/pieces.dart';
import 'package:clean_chess/chess/utilities/extensions.dart';
import 'package:clean_chess/chess/core/utilities/enums.dart';
import 'package:clean_chess/chess/core/utilities/extensions.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_chess/chess/models/move.dart';
import 'package:clean_chess/chess/models/board.dart';
import 'package:clean_chess/chess/error/failures.dart';

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
      return Right(board);
    } catch (e) {
      return Left(InvalidFen());
    }
  }

  @override
  Either<Failure, Fen> getFen() {
    String castlingRights = "";

    // Castling rights
    final whiteKingSide = board.canCastle(
      color: PieceColor.white,
      isHColumn: true,
    );
    if (whiteKingSide.isLeft()) return Left(whiteKingSide.left);
    if (whiteKingSide.right) castlingRights += "K";

    final whiteQueenSide = board.canCastle(
      color: PieceColor.white,
      isHColumn: false,
    );
    if (whiteQueenSide.isLeft()) return Left(whiteQueenSide.left);
    if (whiteQueenSide.right) castlingRights += "Q";

    final blackKingSide = board.canCastle(
      color: PieceColor.black,
      isHColumn: true,
    );
    if (blackKingSide.isLeft()) return Left(blackKingSide.left);
    if (blackKingSide.right) castlingRights += "k";

    final blackQueenSide = board.canCastle(
      color: PieceColor.black,
      isHColumn: false,
    );
    if (blackQueenSide.isLeft()) return Left(blackQueenSide.left);
    if (blackQueenSide.right) castlingRights += "q";

    if (castlingRights.isEmpty) castlingRights = "-";

    // En passant
    final enPassantSquare = board.enPassantSquare();
    if (enPassantSquare.isLeft()) return Left(enPassantSquare.left);

    final enPassant = (enPassantSquare.right as String?) ?? "-";

    // Halfmove clock
    final int halfmoveClock = board.halfmoveClock;

    // Fullmove number
    final int fullmoveNumber = board.fullmoveNumber;

    return Right(
      Fen(
        board.positionsGen(),
        _currentPlayerTurn,
        castlingRights,
        enPassant,
        halfmoveClock,
        fullmoveNumber,
      ),
    );
  }

  @override
  Either<Failure, Board> move(Move move) {
    if (_currentMoveIndex != board.totalKnownMoves) {
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
    if (_currentMoveIndex == board.totalKnownMoves)
      return Left(NoNextMoveFailure());
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

    return board.planPath(boardCell);
  }

  void _invertTurn() {
    _currentPlayerTurn = _currentPlayerTurn == PieceColor.white
        ? PieceColor.black
        : PieceColor.white;
  }
}
