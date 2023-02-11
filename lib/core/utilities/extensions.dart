import 'package:clean_chess/features/clean_chess/data/models/square.dart';

extension BoardHelper on List<List<Square>> {
  Square? offsetSquare(String squareCoord, int x, int y) {
    const letters = 'abcdefgh';
    final newY = int.parse(squareCoord[1]) + y;
    final newXPos = letters.indexOf(squareCoord[0]) + x;
    if (newXPos < 0 || newXPos > 7 || newY < 1 || newY > 8) {
      return null;
    }
    final newX = letters[newXPos];
    return expand((element) => element)
        .firstWhere((element) => element.coord == '$newX$newY');
  }

  Iterable<Square> line(String squareCoord, int x, int y) sync* {
    Square? square = offsetSquare(squareCoord, x, y);
    while (square != null) {
      yield square;
      square = offsetSquare(square.coord, x, y);
    }
  }
}
