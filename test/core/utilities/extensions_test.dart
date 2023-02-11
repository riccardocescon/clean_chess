import 'package:clean_chess/core/utilities/extensions.dart';
import 'package:clean_chess/features/clean_chess/data/models/board.dart';
import 'package:clean_chess/features/clean_chess/data/models/square.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Board board;

  setUp(() {
    List<List<Square>> squares = [];
    const alphabet = 'abcdefgh';
    for (int col = 0; col < 8; col++) {
      final List<Square> rows = [];
      for (int row = 0; row < 8; row++) {
        rows.add(Square(coord: '${alphabet[row]}${8 - col}'));
      }
      squares.add(rows);
    }
    board = Board(squares: squares);
  });

  group('Offset', () {
    test("e2 e4", () {
      final square = board.squares.offsetSquare('e2', 0, 2);
      expect(square!.coord, 'e4');
    });

    test("d3 c5", () {
      final square = board.squares.offsetSquare('d3', -1, 2);
      expect(square!.coord, 'c5');
    });
  });
}
