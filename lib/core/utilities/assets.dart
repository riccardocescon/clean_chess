import 'package:dartchess/dartchess.dart';

List<Piece> get whitePieces => [
      ...whitePromotionPieces,
      Piece.whitePawn,
      Piece.whiteKing,
    ];

List<Piece> get blackPieces => [
      ...blackPromotionPieces,
      Piece.blackPawn,
      Piece.blackKing,
    ];

List<Piece> get whitePromotionPieces => [
      Piece.whiteQueen,
      Piece.whiteRook,
      Piece.whiteBishop,
      Piece.whiteKnight,
    ];

List<Piece> get blackPromotionPieces => [
      Piece.blackQueen,
      Piece.blackRook,
      Piece.blackBishop,
      Piece.blackKnight,
    ];

/// Converts a [Piece] to the correct image path
String getPiecePath(Piece piece) {
  final paths = {
    Piece.whitePawn: 'assets/pieces/flat/wP.png',
    Piece.whiteKnight: 'assets/pieces/flat/wN.png',
    Piece.whiteBishop: 'assets/pieces/flat/wB.png',
    Piece.whiteRook: 'assets/pieces/flat/wR.png',
    Piece.whiteQueen: 'assets/pieces/flat/wQ.png',
    Piece.whiteKing: 'assets/pieces/flat/wK.png',
    Piece.blackPawn: 'assets/pieces/flat/bP.png',
    Piece.blackKnight: 'assets/pieces/flat/bN.png',
    Piece.blackBishop: 'assets/pieces/flat/bB.png',
    Piece.blackRook: 'assets/pieces/flat/bR.png',
    Piece.blackQueen: 'assets/pieces/flat/bQ.png',
    Piece.blackKing: 'assets/pieces/flat/bK.png',
  };

  return paths[piece]!;
}
