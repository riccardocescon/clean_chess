import 'package:clean_chess/core/utilities/enums.dart';
import 'package:clean_chess/features/clean_chess/data/models/piece.dart';

String fenLetter(Piece piece) {
  String letter;
  if (piece is Pawn) {
    letter = 'P';
  } else if (piece is Knight) {
    letter = 'N';
  } else if (piece is Bishop) {
    letter = 'B';
  } else if (piece is Rook) {
    letter = 'R';
  } else if (piece is Queen) {
    letter = 'Q';
  } else if (piece is King) {
    letter = 'K';
  } else {
    throw Exception('Unknown piece type');
  }
  return piece.color == PieceColor.white ? letter : letter.toLowerCase();
}

Piece fromFenLetter(String letter) {
  Piece piece;
  if (letter == 'P') {
    piece = Pawn(color: PieceColor.white);
  } else if (letter == 'N') {
    piece = Knight(color: PieceColor.white);
  } else if (letter == 'B') {
    piece = Bishop(color: PieceColor.white);
  } else if (letter == 'R') {
    piece = Rook(color: PieceColor.white);
  } else if (letter == 'Q') {
    piece = Queen(color: PieceColor.white);
  } else if (letter == 'K') {
    piece = King(color: PieceColor.white);
  } else if (letter == 'p') {
    piece = Pawn(color: PieceColor.black);
  } else if (letter == 'n') {
    piece = Knight(color: PieceColor.black);
  } else if (letter == 'b') {
    piece = Bishop(color: PieceColor.black);
  } else if (letter == 'r') {
    piece = Rook(color: PieceColor.black);
  } else if (letter == 'q') {
    piece = Queen(color: PieceColor.black);
  } else if (letter == 'k') {
    piece = King(color: PieceColor.black);
  } else {
    throw Exception('Unknown piece type');
  }
  return piece;
}
