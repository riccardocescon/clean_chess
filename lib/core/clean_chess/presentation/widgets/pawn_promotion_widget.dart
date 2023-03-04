import 'package:clean_chess/chess/abstractions/piece.dart';
import 'package:clean_chess/chess/core/utilities/assets.dart';
import 'package:clean_chess/chess/core/utilities/enums.dart';
import 'package:clean_chess/chess/models/pieces.dart';
import 'package:flutter/material.dart';

Widget pawnPromotionPiece(BuildContext context, Piece piece) {
  assert(piece is! Pawn);
  assert(piece is! King);
  final path = {
    Queen: piece.color == PieceColor.white ? flatWhiteQueen : flatBlackQueen,
    Rook: piece.color == PieceColor.white ? flatWhiteRook : flatBlackRook,
    Bishop: piece.color == PieceColor.white ? flatWhiteBishop : flatBlackBishop,
    Knight: piece.color == PieceColor.white ? flatWhiteKnight : flatBlackKnight,
  };
  return GestureDetector(
    onTap: () {
      Navigator.pop(context, piece);
    },
    child: Image.asset(path[piece.runtimeType]!, scale: 5),
  );
}
