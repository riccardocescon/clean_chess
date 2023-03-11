import 'package:cleanchess/chess/abstractions/piece.dart';
import 'package:cleanchess/chess/core/utilities/assets.dart';
import 'package:cleanchess/chess/core/utilities/enums.dart';

class Pawn extends Piece<Pawn> {
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

  @override
  Pawn clone() => Pawn(color);

  Pawn(this.color);
}

class Bishop extends Piece<Bishop> {
  @override
  final String name = 'Bishop';

  @override
  String get imagePath =>
      color == PieceColor.white ? flatWhiteBishop : flatBlackBishop;

  @override
  String get toFen => color == PieceColor.white ? 'B' : 'b';

  @override
  final PieceColor color;

  @override
  Bishop clone() => Bishop(color);

  Bishop(this.color);
}

class Knight extends Piece<Knight> {
  @override
  final String name = 'Knight';

  @override
  String get imagePath =>
      color == PieceColor.white ? flatWhiteKnight : flatBlackKnight;

  @override
  String get toFen => color == PieceColor.white ? 'N' : 'n';

  @override
  final PieceColor color;

  @override
  Knight clone() => Knight(color);

  Knight(this.color);
}

class Rook extends Piece<Rook> {
  @override
  final String name = 'Rook';

  @override
  String get imagePath =>
      color == PieceColor.white ? flatWhiteRook : flatBlackRook;

  @override
  String get toFen => color == PieceColor.white ? 'R' : 'r';

  void setCastlingRightFromFen() => moveTimes = 0;

  @override
  final PieceColor color;

  @override
  Rook clone() => Rook(color);

  Rook(this.color);
}

class Queen extends Piece {
  @override
  final String name = 'Queen';

  @override
  String get imagePath =>
      color == PieceColor.white ? flatWhiteQueen : flatBlackQueen;

  @override
  String get toFen => color == PieceColor.white ? 'Q' : 'q';

  @override
  final PieceColor color;

  @override
  Queen clone() => Queen(color);

  Queen(this.color);
}

class King extends Piece {
  @override
  final String name = 'King';

  @override
  String get imagePath =>
      color == PieceColor.white ? flatWhiteKing : flatBlackKing;

  @override
  String get toFen => color == PieceColor.white ? 'K' : 'k';

  void setCastlingRightFromFen() => moveTimes = 0;

  @override
  final PieceColor color;

  @override
  King clone() => King(color);

  King(this.color);
}
