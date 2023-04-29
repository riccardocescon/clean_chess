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
    Piece.whitePawn: 'assets/pieces/flat/white_pawn.png',
    Piece.whiteKnight: 'assets/pieces/flat/white_knight.png',
    Piece.whiteBishop: 'assets/pieces/flat/white_bishop.png',
    Piece.whiteRook: 'assets/pieces/flat/white_rook.png',
    Piece.whiteQueen: 'assets/pieces/flat/white_queen.png',
    Piece.whiteKing: 'assets/pieces/flat/white_king.png',
    Piece.blackPawn: 'assets/pieces/flat/black_pawn.png',
    Piece.blackKnight: 'assets/pieces/flat/black_knight.png',
    Piece.blackBishop: 'assets/pieces/flat/black_bishop.png',
    Piece.blackRook: 'assets/pieces/flat/black_rook.png',
    Piece.blackQueen: 'assets/pieces/flat/black_queen.png',
    Piece.blackKing: 'assets/pieces/flat/black_king.png',
  };

  return paths[piece]!;
}
