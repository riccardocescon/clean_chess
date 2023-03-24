import 'package:cleanchess/core/chesskit/chesskit_failures.dart';
import 'package:dartchess/dartchess.dart';
import 'package:dartz/dartz.dart' as dartz;

class ChessKit {
  /// The current state of the game
  late Chess _chess;

  /// Getter for the pieces on the board
  List<Tuple2<Square, Piece>> get pieces => _chess.board.pieces.toList();

  /// Getter for the current turn
  Side get turn => _chess.turn;

  ChessKit(Setup setup) : _chess = Chess.fromSetup(setup);

  /// Moves a piece on the board and returns the new state of the game
  /// Returns a [ChesskitFailure] if the move is invalid
  /// Returns a [Chess] object if the move is valid
  dartz.Either<ChesskitFailure, Chess> move(String rawUciMove) {
    final move = Move.fromUci(rawUciMove);
    if (!_isValidMove(rawUciMove)) {
      return const dartz.Left(InvalidMoveFailure());
    }

    _chess = _chess.play(move!) as Chess;

    return dartz.Right(_chess);
  }

  /// Checks if the move is valid
  bool _isValidMove(String rawUciMove) {
    final move = Move.fromUci(rawUciMove);
    return move != null && _chess.isLegal(move);
  }

  /// Get the legal moves for the given [square]
  List<Square> getLegalMoves(Square square) {
    // Assert that the square is not empty
    final piece = _chess.board.pieceAt(square);
    if (piece == null) {
      return [];
    }

    // Get the legal moves for the piece
    List<Square> legalMoves = [];
    _chess.legalMoves.where((key, value) => key == square).forEach(
      (key, value) {
        legalMoves.addAll(value.squares.toList());
      },
    );

    return legalMoves;
  }
}
