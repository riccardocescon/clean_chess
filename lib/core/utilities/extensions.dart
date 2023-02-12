import 'package:clean_chess/features/clean_chess/data/models/piece.dart';
import 'package:clean_chess/features/clean_chess/data/models/square.dart';

import 'enums.dart';

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

  Iterable<Square> line(
    String squareCoord,
    StraightDirection direction,
    int amount,
  ) sync* {
    for (int i = 1; i <= amount.abs(); i++) {
      final square = offsetSquare(
        squareCoord,
        i * direction.x,
        i * direction.y,
      );
      if (square == null) {
        return;
      }
      yield square;
    }
  }

  Iterable<Square> diagonal(
    String squareCoord,
    DiagonalDirection direction,
    int amount,
  ) sync* {
    for (int i = 1; i <= amount.abs(); i++) {
      final square = offsetSquare(
        squareCoord,
        i * direction.x,
        i * direction.y,
      );
      if (square == null) {
        return;
      }
      yield square;
    }
  }
}

extension IterableHelper<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    for (final element in this) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }
}

extension PieceColorHelper on PieceColor {
  String get path => this == PieceColor.white ? 'white' : 'black';
  PieceColor get opposite =>
      this == PieceColor.white ? PieceColor.black : PieceColor.white;
}

extension StraightDirectionHelper on StraightDirection {
  int get x {
    final values = {
      StraightDirection.horizontalRight: 1,
      StraightDirection.horizontalLeft: -1,
      StraightDirection.verticalBottom: 0,
      StraightDirection.verticalTop: 0,
    };

    return values[this]!;
  }

  int get y {
    final values = {
      StraightDirection.horizontalRight: 0,
      StraightDirection.horizontalLeft: 0,
      StraightDirection.verticalBottom: -1,
      StraightDirection.verticalTop: 1,
    };

    return values[this]!;
  }
}

extension DiagonalDirectionHelper on DiagonalDirection {
  int get x {
    final values = {
      DiagonalDirection.topLeft: -1,
      DiagonalDirection.topRight: 1,
      DiagonalDirection.bottomLeft: -1,
      DiagonalDirection.bottomRight: 1,
    };

    return values[this]!;
  }

  int get y {
    final values = {
      DiagonalDirection.topLeft: 1,
      DiagonalDirection.topRight: 1,
      DiagonalDirection.bottomLeft: -1,
      DiagonalDirection.bottomRight: -1,
    };

    return values[this]!;
  }
}

extension KnightDirectionHelper on KnightDirection {
  int get x {
    final values = {
      KnightDirection.topLeft: -2,
      KnightDirection.topRight: 2,
      KnightDirection.bottomLeft: -2,
      KnightDirection.bottomRight: 2,
      KnightDirection.leftTop: -1,
      KnightDirection.leftBottom: -1,
      KnightDirection.rightTop: 1,
      KnightDirection.rightBottom: 1,
    };

    return values[this]!;
  }

  int get y {
    final values = {
      KnightDirection.topLeft: 1,
      KnightDirection.topRight: 1,
      KnightDirection.bottomLeft: -1,
      KnightDirection.bottomRight: -1,
      KnightDirection.leftTop: 2,
      KnightDirection.leftBottom: -2,
      KnightDirection.rightTop: 2,
      KnightDirection.rightBottom: -2,
    };

    return values[this]!;
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
