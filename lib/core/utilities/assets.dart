import 'package:cleanchess/core/utilities/enum_pieces.dart';
import 'package:cleanchess/features/clean_chess/data/models/user_settings_model.dart';
import 'package:cleanchess/injection_container.dart';
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
///
PieceTheme get pieceTheme => sl<UserSettingsModel>().pieceTheme;

String getPiecePath(Piece piece) {
  final paths = {
    Piece.whitePawn: '${pieceTheme.location}wP.svg',
    Piece.whiteKnight: '${pieceTheme.location}wN.svg',
    Piece.whiteBishop: '${pieceTheme.location}wB.svg',
    Piece.whiteRook: '${pieceTheme.location}wR.svg',
    Piece.whiteQueen: '${pieceTheme.location}wQ.svg',
    Piece.whiteKing: '${pieceTheme.location}wK.svg',
    Piece.blackPawn: '${pieceTheme.location}bP.svg',
    Piece.blackKnight: '${pieceTheme.location}bN.svg',
    Piece.blackBishop: '${pieceTheme.location}bB.svg',
    Piece.blackRook: '${pieceTheme.location}bR.svg',
    Piece.blackQueen: '${pieceTheme.location}bQ.svg',
    Piece.blackKing: '${pieceTheme.location}bK.svg',
  };

  return paths[piece]!;
}
