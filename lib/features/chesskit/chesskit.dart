import 'package:cleanchess/core/chesskit/chesskit_failures.dart';
import 'package:dartchess/dartchess.dart';
import 'package:dartz/dartz.dart' as dartz;

class ChessKit {
  late Chess _chess;

  List<Tuple2<Square, Piece>> get pieces => _chess.board.pieces.toList();
  Chess get chess => _chess;
  Side get turn => _chess.turn;

  ChessKit(Setup setup) : _chess = Chess.fromSetup(setup);

  dartz.Either<ChesskitFailure, Chess> move(String rawUciMove) {
    final move = Move.fromUci(rawUciMove);
    if (!_isValidMove(rawUciMove)) {
      return const dartz.Left(InvalidMoveFailure());
    }

    _chess = _chess.play(move!) as Chess;

    return dartz.Right(_chess);
  }

  bool _isValidMove(String rawUciMove) {
    final move = Move.fromUci(rawUciMove);
    return move != null && _chess.isLegal(move);
  }

  List<Square> getLegalMoves(Square square) {
    // Assert that the square is not empty
    final piece = _chess.board.pieceAt(square);
    if (piece == null) {
      return [];
    }

    // Get the legal moves for the piece
    List<Square> legalMoves = [];
    chess.legalMoves.where((key, value) => key == square).forEach(
      (key, value) {
        legalMoves.addAll(value.squares.toList());
      },
    );

    return legalMoves;
  }
}
