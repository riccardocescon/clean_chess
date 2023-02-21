import 'package:clean_chess/core/utilities/enums.dart';
import 'package:clean_chess/features/clean_chess/data/models/piece.dart';
import 'package:clean_chess/features/clean_chess/data/models/square.dart';
import 'package:clean_chess/core/utilities/piece_helper.dart' as piece_helper;
import 'package:clean_chess/features/clean_chess/data/repositories/board_repository_impl.dart';
import 'package:clean_chess/features/clean_chess/domain/entities/piece_selected_params.dart';

class Board {
  late List<List<Square>> squares;
  late PieceColor _colorTurn;
  PieceColor get colorTurn => _colorTurn;

  Board({required this.squares, required PieceColor colorTurn}) {
    _colorTurn = colorTurn;
  }

  void pieceMoved() {
    _colorTurn =
        _colorTurn == PieceColor.white ? PieceColor.black : PieceColor.white;
  }

  void _reset() {
    for (final square in squares.expand((element) => element)) {
      square.piece = null;
      square.whiteControl = 0;
      square.blackControl = 0;
    }
  }

  void setFen(String fen) {
    _reset();
    // r6k/pp2r2p/4Rp1Q/3p4/8/1N1P2R1/PqP2bPP/7K b - - 0 24,
    final List<String> fenSplit = fen.split(' ');
    final List<String> fenRows = fenSplit[0].split('/');
    for (int column = 0; column < 8; column++) {
      final String fenRow = fenRows[column];
      int currentCell = 0;
      for (int letterPos = 0; letterPos < fenRow.length; letterPos++) {
        final letter = fenRow[letterPos];
        if (int.tryParse(letter) == null) {
          // Piece
          final piece = piece_helper.fromFenLetter(letter);
          final square = squares[column][currentCell];
          square.piece = piece;
          currentCell++;
          if (piece is Pawn) {
            piece.totalMoves = 1;
            if (piece.color == PieceColor.white && square.coord[1] == "2") {
              piece.totalMoves = 0;
            } else if (piece.color == PieceColor.black &&
                square.coord[1] == "7") {
              piece.totalMoves = 0;
            }
          } else if (piece is King) {
            piece.totalMoves = 1;
            if (piece.color == PieceColor.white && square.coord == "e1") {
              piece.totalMoves = 0;
            } else if (piece.color == PieceColor.black &&
                square.coord == "e8") {
              piece.totalMoves = 0;
            }
          }
        } else {
          // Spaces
          currentCell += int.parse(letter);
        }
      }
    }

    recalculateControl();

    _colorTurn = fenSplit[1] == 'w' ? PieceColor.white : PieceColor.black;
  }

  void recalculateControl() {
    for (final square in squares.expand((element) => element)) {
      square.whiteControl = 0;
      square.blackControl = 0;
    }

    for (final square in squares
        .expand((element) => element)
        .where((element) => element.piece != null)) {
      if (square.piece is King) continue;
      final attackingSquares = BoardRepositoryImpl().pieceSelected(
        PieceSelectedParams(
          board: this,
          squareCoord: square.coord,
        ),
      );

      for (final attackingSquare in attackingSquares.getOrElse(() => [])) {
        if (square.piece!.color == PieceColor.white) {
          attackingSquare.whiteControl++;
        } else {
          attackingSquare.blackControl++;
        }
      }
    }
  }

  String get toFen {
    String fen = '';
    for (int column = 0; column < 8; column++) {
      int emptySpaces = 0;
      for (int row = 0; row < 8; row++) {
        final square = squares[column][row];
        if (square.piece == null) {
          emptySpaces++;
        } else {
          if (emptySpaces > 0) {
            fen += emptySpaces.toString();
            emptySpaces = 0;
          }
          fen += piece_helper.fenLetter(square.piece!);
        }
      }
      if (emptySpaces > 0) {
        fen += emptySpaces.toString();
      }
      if (column < 7) {
        fen += '/';
      }
    }
    return "$fen ${_colorTurn == PieceColor.white ? 'w' : 'b'} - - 0 1";
  }
}
