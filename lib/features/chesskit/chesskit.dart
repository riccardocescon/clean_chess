import 'package:cleanchess/core/chesskit/chesskit_failures.dart';
import 'package:dartchess/dartchess.dart';
import 'package:dartz/dartz.dart';

class ChessKit {
  late Chess _chess;

  ChessKit(Setup setup) : _chess = Chess.fromSetup(setup);

  Either<ChesskitFailure, Chess> move(String rawUciMove) {
    final move = Move.fromUci(rawUciMove);
    if (!_isValidMove(rawUciMove)) return const Left(InvalidMoveFailure());

    _chess = _chess.play(move!) as Chess;

    return Right(_chess);
  }

  bool _isValidMove(String rawUciMove) {
    final move = Move.fromUci(rawUciMove);
    return move != null && _chess.isLegal(move);
  }
}
