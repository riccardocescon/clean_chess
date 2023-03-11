import 'package:cleanchess/chess/core/utilities/enums.dart';
import 'package:cleanchess/chess/core/utilities/extensions.dart';
import 'package:equatable/equatable.dart';

class Fen with EquatableMixin {
  final String positions;
  final PieceColor turn;
  final String castlingRights;
  final String enPassantSquare;
  final int halfmoveClock;
  final int fullmoveNumber;

  String get fen =>
      "$positions ${turn.fenValue} $castlingRights $enPassantSquare $halfmoveClock $fullmoveNumber";

  // rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq e3 0 1
  // rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR: Position
  // b: Turn
  // KQkq: Castling rights (-)
  // e3: En passant square (-)
  // 0: Halfmove clock
  // 1: Fullmove number

  Fen(
    this.positions,
    this.turn,
    this.castlingRights,
    this.enPassantSquare,
    this.halfmoveClock,
    this.fullmoveNumber,
  );

  Fen.fromRaw(String fen)
      : positions = fen.split(" ").first,
        turn = fen.split(" ")[1] == "b" ? PieceColor.black : PieceColor.white,
        castlingRights = fen.split(" ")[2],
        enPassantSquare = fen.split(" ")[3],
        halfmoveClock = int.parse(fen.split(" ")[4]),
        fullmoveNumber = int.parse(fen.split(" ")[5]);

  @override
  List<Object?> get props => [
        positions,
        turn,
        castlingRights,
        enPassantSquare,
        halfmoveClock,
        fullmoveNumber
      ];
}
