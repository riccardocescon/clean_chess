import 'package:clean_chess/features/clean_chess/data/models/board.dart';
import 'package:clean_chess/features/clean_chess/data/models/square.dart';

Board setupEmptyBoard() {
  List<List<Square>> squares = [];
  const alphabet = 'abcdefgh';
  for (int col = 0; col < 8; col++) {
    final List<Square> rows = [];
    for (int row = 0; row < 8; row++) {
      rows.add(Square(coord: '${alphabet[row]}${8 - col}'));
    }
    squares.add(rows);
  }
  return Board(squares: squares);
}
