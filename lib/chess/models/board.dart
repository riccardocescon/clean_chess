import 'package:clean_chess/chess/abstractions/piece.dart';
import 'package:clean_chess/chess/error/failures.dart';
import 'package:clean_chess/chess/models/cell.dart';
import 'package:clean_chess/chess/models/fen.dart';
import 'package:clean_chess/chess/utilities/extensions.dart';
import 'package:clean_chess/chess/utilities/utils.dart';
import 'package:clean_chess/core/utilities/extensions.dart';
import 'package:dartz/dartz.dart';

class Board {
  late final Iterable<Iterable<Cell>> _board;

  Iterable<Cell> get cells => _board.expand((element) => element);

  final String _rowNames = 'abcdefgh';

  Board.empty() {
    List<List<Cell>> cells = [];
    for (int column = 8; column > 0; column--) {
      for (int row = 0; row < 8; row++) {
        int index = (column - 1) * 8 + row;
        cells.add([
          Cell(
            index,
            _rowNames[row] + column.toString(),
          ),
        ]);
      }
    }
    _board = cells;
  }

  Board.fromFen(Fen fen) {
    // r6k/pp2r2p/4Rp1Q/3p4/8/1N1P2R1/PqP2bPP/7K b - - 0 24,
    final emptyBoard = Board.empty();
    final rows = fen.fen.split('/');
    for (int column = 8; column > 0; column--) {
      final currentRow = rows[8 - column];
      int currentCell = 0;
      for (int row = 0; row < currentRow.length; row++) {
        final currentLetter = currentRow[row];
        final number = int.tryParse(currentLetter);
        if (number != null) {
          // Empty spaces
          currentCell += number;
        } else {
          final piece = getPieceFromFen(currentLetter);
          if (piece.isLeft()) throw Exception(piece.left);

          final coord = _rowNames[currentCell] + column.toString();
          emptyBoard._board
              .expand((element) => element)
              .firstWhere((element) => element.coord == coord)
              .piece = piece.right;

          currentCell++;
        }
      }
    }

    _board = emptyBoard._board;
  }

  String toFen() {
    String fen = '';
    for (int column = 8; column > 0; column--) {
      int emptySpaces = 0;
      for (int row = 0; row < 8; row++) {
        final coord = _rowNames[row] + column.toString();
        final cell = getCell(coord);
        if (cell.isLeft()) throw Exception(cell.left);
        if (cell.right.piece == null) {
          emptySpaces++;
        } else {
          if (emptySpaces > 0) {
            fen += emptySpaces.toString();
            emptySpaces = 0;
          }
          fen += cell.right.piece!.toFen;
        }
      }
      if (emptySpaces > 0) {
        fen += emptySpaces.toString();
        emptySpaces = 0;
      }
      if (column > 1) {
        fen += '/';
      }
    }
    return fen;
  }

  Either<Failure, Cell> getCell(String coord) {
    final cell = _board
        .expand((element) => element)
        .firstWhereOrNull((element) => element.coord == coord);
    return cell != null
        ? Right(cell)
        : Left(PieceNotFoundOnCellFailure('No piece found on $coord'));
  }

  Either<Failure, Empty> setPiece({
    required String coord,
    required Piece piece,
  }) {
    final cell = getCell(coord);
    if (cell.isLeft()) {
      return cell.left;
    }
    cell.right.piece = piece;
    return const Right(Empty());
  }
}
