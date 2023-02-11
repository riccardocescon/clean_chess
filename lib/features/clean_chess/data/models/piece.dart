import 'package:flutter/material.dart';

@immutable
abstract class Piece {
  final String imagePath;
  final String color;
  const Piece({required this.color, required this.imagePath});
}

class Pawn extends Piece {
  const Pawn({
    required String color,
  }) : super(
          color: color,
          imagePath: 'assets/pieces/base/${color}_pawn.png',
        );
}

class Rook extends Piece {
  const Rook({
    required String color,
  }) : super(
          color: color,
          imagePath: 'assets/pieces/base/${color}_rook.png',
        );
}

class Knight extends Piece {
  const Knight({
    required String color,
  }) : super(
          color: color,
          imagePath: 'assets/pieces/base/${color}_knight.png',
        );
}

class Bishop extends Piece {
  const Bishop({
    required String color,
  }) : super(
          color: color,
          imagePath: 'assets/pieces/base/${color}_bishop.png',
        );
}

class Queen extends Piece {
  const Queen({
    required String color,
  }) : super(
          color: color,
          imagePath: 'assets/pieces/base/${color}_queen.png',
        );
}

class King extends Piece {
  const King({
    required String color,
  }) : super(
          color: color,
          imagePath: 'assets/pieces/base/${color}_king.png',
        );
}
