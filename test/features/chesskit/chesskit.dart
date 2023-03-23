import 'package:dartchess/dartchess.dart';

class ChessKit {
  late Chess _chess;

  ChessKit(Setup setup) : _chess = Chess.fromSetup(setup);

  Chess move(String rawUciMove) {
    final move = Move.fromUci(rawUciMove);
    if (!_isValidMove(rawUciMove)) {
      print('Invalid move');
      return _chess;
    }

    return _chess.play(move!) as Chess;
  }

  bool _isValidMove(String rawUciMove) {
    final move = Move.fromUci(rawUciMove);
    return move != null && _chess.isLegal(move);
  }
}
