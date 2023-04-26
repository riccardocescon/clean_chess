import 'package:chess/chess.dart' as chess;

String pgnToFen(String pgn) {
  chess.Chess myChess = chess.Chess();
  List<String> moves = pgn.split(' ');
  for (var element in moves) {
    myChess.move(element);
  }
  return myChess.fen;
}
