import 'package:clean_chess/core/utilities/extensions.dart';
import 'package:clean_chess/features/clean_chess/data/models/board.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../setup.dart';

void main() {
  late Board board;

  setUp(() {
    board = setupEmptyBoard();
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
