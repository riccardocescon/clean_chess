import 'package:clean_chess/chess/abstractions/piece.dart';
import 'package:clean_chess/chess/core/utilities/assets.dart';
import 'package:clean_chess/chess/core/utilities/enums.dart';

class Pawn extends Piece {
  @override
  final String name = 'Pawn';

  @override
  String get imagePath => color == PieceColor.white ? whitePawn : blackPawn;

  @override
  String get toFen => color == PieceColor.white ? 'P' : 'p';

  @override
  final PieceColor color;

  void setEnPassantRightFromFen() => moveTimes = 0;
  void setNonMovedPawn() => moveTimes = 0;

  Pawn(this.color);
}

class Bishop extends Piece {
  @override
  final String name = 'Bishop';

  @override
  String get imagePath => color == PieceColor.white ? whiteBishop : blackBishop;

  @override
  String get toFen => color == PieceColor.white ? 'B' : 'b';

  @override
  final PieceColor color;

  Bishop(this.color);
}

class Knight extends Piece {
  @override
  final String name = 'Knight';

  @override
  String get imagePath => color == PieceColor.white ? whiteKnight : blackKnight;

  @override
  String get toFen => color == PieceColor.white ? 'N' : 'n';

  @override
  final PieceColor color;

  Knight(this.color);
}

class Rook extends Piece {
  @override
  final String name = 'Rook';

  @override
  String get imagePath => color == PieceColor.white ? whiteRook : blackRook;

  @override
  String get toFen => color == PieceColor.white ? 'R' : 'r';

  void setCastlingRightFromFen() => moveTimes = 0;

  @override
  final PieceColor color;

  Rook(this.color);
}

class Queen extends Piece {
  @override
  final String name = 'Queen';

  @override
  String get imagePath => color == PieceColor.white ? whiteQueen : blackQueen;

  @override
  String get toFen => color == PieceColor.white ? 'Q' : 'q';

  @override
  final PieceColor color;

  Queen(this.color);
}

class King extends Piece {
  @override
  final String name = 'King';

  @override
  String get imagePath => color == PieceColor.white ? whiteKing : blackKing;

  @override
  String get toFen => color == PieceColor.white ? 'K' : 'k';

  void setCastlingRightFromFen() => moveTimes = 0;

  @override
  final PieceColor color;

  King(this.color);
}
