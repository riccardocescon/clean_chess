import 'package:clean_chess/core/mixins/trackable_move.dart';
import 'package:clean_chess/core/utilities/enums.dart';
import 'package:clean_chess/core/utilities/extensions.dart';

abstract class Piece with TrackableMove {
  final String imagePath;
  final PieceColor color;
  Piece({required this.color, required this.imagePath});
}

class Pawn extends Piece {
  Pawn({
    required PieceColor color,
  }) : super(
          color: color,
          imagePath: 'assets/pieces/base/${color.path}_pawn.png',
        );
}

class Rook extends Piece {
  Rook({
    required PieceColor color,
  }) : super(
          color: color,
          imagePath: 'assets/pieces/base/${color.path}_rook.png',
        );
}

class Knight extends Piece {
  Knight({
    required PieceColor color,
  }) : super(
          color: color,
          imagePath: 'assets/pieces/base/${color.path}_knight.png',
        );
}

class Bishop extends Piece {
  Bishop({
    required PieceColor color,
  }) : super(
          color: color,
          imagePath: 'assets/pieces/base/${color.path}_bishop.png',
        );
}

class Queen extends Piece {
  Queen({
    required PieceColor color,
  }) : super(
          color: color,
          imagePath: 'assets/pieces/base/${color.path}_queen.png',
        );
}

class King extends Piece {
  King({
    required PieceColor color,
  }) : super(
          color: color,
          imagePath: 'assets/pieces/base/${color.path}_king.png',
        );
}
