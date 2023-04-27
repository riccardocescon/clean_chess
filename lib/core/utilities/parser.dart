import 'package:chess/chess.dart' as chess;
import 'package:dartchess/dartchess.dart';

Tuple2<String, Side> parsePGN(String pgn) {
  chess.Chess myChess = chess.Chess();
  List<String> moves = pgn.split(' ');
  for (var element in moves) {
    myChess.move(element);
  }
  final color = myChess.turn == chess.Chess.WHITE ? Side.white : Side.black;
  return Tuple2(myChess.fen, color);
}
