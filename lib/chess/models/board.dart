import 'package:clean_chess/chess/abstractions/piece.dart';
import 'package:clean_chess/chess/error/failures.dart';
import 'package:clean_chess/chess/models/cell.dart';
import 'package:clean_chess/chess/models/fen.dart';
import 'package:clean_chess/chess/models/pieces.dart';
import 'package:clean_chess/chess/utilities/extensions.dart';
import 'package:clean_chess/chess/utilities/utils.dart';
import 'package:clean_chess/core/utilities/enums.dart';
import 'package:clean_chess/core/utilities/extensions.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class Board {
  final letters = 'abcdefgh';

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

  //#region Piece Moves Helpers
  @visibleForTesting
  Either<Failure, Iterable<Cell>> getPawnMoves(Cell cell) {
    // Get the reference cell from the board
    final maybeBoardCell = getCell(cell.coord);
    if (maybeBoardCell.isLeft()) return maybeBoardCell.left;

    final boardCell = maybeBoardCell.right;

    // Asserts
    if (boardCell == null) {
      return Left(CellNotFoundOnBoard('No cell found ${cell.coord}'));
    }

    if (boardCell.piece == null) {
      return Left(
        PieceNotFoundOnCellFailure('No piece found on ${cell.coord}'),
      );
    }

    if (boardCell.piece is! Pawn) {
      return Left(
        UnexpectedPieceType('Expected Pawn, got ${boardCell.piece}'),
      );
    }

    // Get free cells in the direction of the pawn
    final moveLength = boardCell.piece!.moveTimes == 0 ? 2 : 1;

    final pieceColor = boardCell.piece!.color;

    final direction = pieceColor == PieceColor.white
        ? StraightDirection.verticalTop
        : StraightDirection.verticalBottom;

    final freeCells = getFreeLinedCells(
      boardCell,
      moveLength,
      direction,
      boardCell.piece!.color,
    );

    if (freeCells.isLeft()) return freeCells.left;

    // Get the valid cells
    final validCells = (freeCells.right as Iterable<Cell>).toList();
    if (validCells.last.piece?.color == pieceColor) {
      validCells.removeLast();
    }

    // Add diagonal moves
    final topRightCell = getFreeDiagonalCells(
      boardCell,
      1,
      pieceColor == PieceColor.white
          ? DiagonalDirection.topRight
          : DiagonalDirection.bottomRight,
      boardCell.piece!.color,
    );
    if (topRightCell.isLeft()) return topRightCell.left;
    final rightCell = (topRightCell.right as Iterable<Cell>).first;
    final isEnemyRight =
        rightCell.piece != null && rightCell.piece?.color != pieceColor;
    if (isEnemyRight) validCells.addAll((topRightCell.right as Iterable<Cell>));

    final topLeftCell = getFreeDiagonalCells(
      boardCell,
      1,
      pieceColor == PieceColor.white
          ? DiagonalDirection.topLeft
          : DiagonalDirection.bottomLeft,
      boardCell.piece!.color,
    );
    if (topLeftCell.isLeft()) return topLeftCell.left;
    final leftCell = (topLeftCell.right as Iterable<Cell>).first;
    final isEnemyLeft =
        leftCell.piece != null && leftCell.piece?.color != pieceColor;
    if (isEnemyLeft) validCells.addAll((topLeftCell.right as Iterable<Cell>));

    // En passant
    if (pieceColor == PieceColor.white) {
      if (cell.row == 5 && cell.piece!.moveTimes == 2) {
        final leftCell =
            getCell("${letters[letters.indexOf(cell.column) - 1]}5");
        final rightCell =
            getCell("${letters[letters.indexOf(cell.column) + 1]}5");
        if (leftCell.isRight() && leftCell.right.piece is Pawn) {
          final pawn = leftCell.right.piece as Pawn;
          if (pawn.moveTimes == 1 && pawn.color == PieceColor.black) {
            final enPassantCell =
                getCell("${letters[letters.indexOf(cell.column) - 1]}6");
            if (enPassantCell.isRight()) {
              validCells.add(enPassantCell.right);
            }
          }
        }
        if (rightCell.isRight() && rightCell.right.piece is Pawn) {
          final pawn = rightCell.right.piece as Pawn;
          if (pawn.moveTimes == 1 && pawn.color == PieceColor.black) {
            final enPassantCell =
                getCell("${letters[letters.indexOf(cell.column) + 1]}6");
            if (enPassantCell.isRight()) {
              validCells.add(enPassantCell.right);
            }
          }
        }
      }
    } else {
      if (cell.row == 4 && cell.piece!.moveTimes == 2) {
        final leftCell =
            getCell("${letters[letters.indexOf(cell.column) - 1]}4");
        final rightCell =
            getCell("${letters[letters.indexOf(cell.column) + 1]}4");
        if (leftCell.isRight() && leftCell.right.piece is Pawn) {
          final pawn = leftCell.right.piece as Pawn;
          if (pawn.moveTimes == 1 && pawn.color == PieceColor.white) {
            final enPassantCell =
                getCell("${letters[letters.indexOf(cell.column) - 1]}3");
            if (enPassantCell.isRight()) {
              validCells.add(enPassantCell.right);
            }
          }
        }
        if (rightCell.isRight() && rightCell.right.piece is Pawn) {
          final pawn = rightCell.right.piece as Pawn;
          if (pawn.moveTimes == 1 && pawn.color == PieceColor.white) {
            final enPassantCell =
                getCell("${letters[letters.indexOf(cell.column) + 1]}3");
            if (enPassantCell.isRight()) {
              validCells.add(enPassantCell.right);
            }
          }
        }
      }
    }

    return Right(validCells);
  }

  @visibleForTesting
  Either<Failure, Iterable<Cell>> getKnightMoves(Cell cell) {
    final maybeBoardCell = getCell(cell.coord);
    if (maybeBoardCell.isLeft()) return maybeBoardCell.left;

    final boardCell = maybeBoardCell.right as Cell;

    // Asserts
    if (boardCell.piece == null) {
      return Left(
        PieceNotFoundOnCellFailure('No piece found on ${cell.coord}'),
      );
    }

    if (boardCell.piece is! Knight) {
      return Left(
        UnexpectedPieceType('Expected Knight, got ${boardCell.piece}'),
      );
    }

    List<Cell> cells = [];

    final pieceColor = boardCell.piece!.color;

    for (final currentDirectionCell in KnightDirection.values) {
      final currentRow = boardCell.row + currentDirectionCell.x;
      final currentColumn =
          letters.indexOf(boardCell.column) + currentDirectionCell.y;

      if (currentRow < 1 || currentRow > 8) continue;
      if (currentColumn < 0 || currentColumn > 7) continue;

      final currentCell = getCell(
        '${letters[currentColumn]}$currentRow',
      );
      if (currentCell.isLeft()) return currentCell.left;

      final currentBoardCell = currentCell.right as Cell;

      if (currentBoardCell.piece == null) {
        cells.add(currentBoardCell);
      } else if (currentBoardCell.piece?.color != pieceColor) {
        cells.add(currentBoardCell);
      }
    }

    return Right(cells);
  }

  @visibleForTesting
  Either<Failure, Iterable<Cell>> getBishopMoves(
    Cell cell, [
    bool ignorePieceTypeAssert = false,
    int directionLength = 7,
  ]) {
    final maybeBoardCell = getCell(cell.coord);
    if (maybeBoardCell.isLeft()) return maybeBoardCell.left;

    final boardCell = maybeBoardCell.right as Cell;

    // Asserts
    if (boardCell.piece == null) {
      return Left(
        PieceNotFoundOnCellFailure('No piece found on ${cell.coord}'),
      );
    }

    if (!ignorePieceTypeAssert && boardCell.piece is! Bishop) {
      return Left(
        UnexpectedPieceType('Expected Bishop, got ${boardCell.piece}'),
      );
    }

    List<Cell> cells = [];

    final pieceColor = boardCell.piece!.color;

    // Top right
    final topRightCells = getFreeDiagonalCells(
      boardCell,
      directionLength,
      DiagonalDirection.topRight,
      pieceColor,
    );
    if (topRightCells.isLeft()) return topRightCells.left;

    cells.addAll(topRightCells.right as Iterable<Cell>);

    // Top left
    final topLeftCells = getFreeDiagonalCells(
      boardCell,
      directionLength,
      DiagonalDirection.topLeft,
      pieceColor,
    );
    if (topLeftCells.isLeft()) return topLeftCells.left;

    cells.addAll(topLeftCells.right as Iterable<Cell>);

    // Bottom right
    final bottomRightCells = getFreeDiagonalCells(
      boardCell,
      directionLength,
      DiagonalDirection.bottomRight,
      pieceColor,
    );
    if (bottomRightCells.isLeft()) return bottomRightCells.left;

    cells.addAll(bottomRightCells.right as Iterable<Cell>);

    // Bottom left
    final bottomLeftCells = getFreeDiagonalCells(
      boardCell,
      directionLength,
      DiagonalDirection.bottomLeft,
      pieceColor,
    );
    if (bottomLeftCells.isLeft()) return bottomLeftCells.left;

    cells.addAll(bottomLeftCells.right as Iterable<Cell>);

    return Right(cells);
  }

  @visibleForTesting
  Either<Failure, Iterable<Cell>> getRookMoves(
    Cell cell, [
    bool ignorePieceTypeAssert = false,
    int directionLength = 7,
  ]) {
    final maybeBoardCell = getCell(cell.coord);
    if (maybeBoardCell.isLeft()) return maybeBoardCell.left;

    final boardCell = maybeBoardCell.right as Cell;

    // Asserts
    if (boardCell.piece == null) {
      return Left(
        PieceNotFoundOnCellFailure('No piece found on ${cell.coord}'),
      );
    }

    if (!ignorePieceTypeAssert && boardCell.piece is! Rook) {
      return Left(
        UnexpectedPieceType('Expected Rook, got ${boardCell.piece}'),
      );
    }

    List<Cell> cells = [];

    final pieceColor = boardCell.piece!.color;

    // Top
    final topCells = getFreeLinedCells(
      boardCell,
      directionLength,
      StraightDirection.verticalTop,
      pieceColor,
    );
    if (topCells.isLeft()) return topCells.left;

    cells.addAll(topCells.right as Iterable<Cell>);

    // Bottom
    final bottomCells = getFreeLinedCells(
      boardCell,
      directionLength,
      StraightDirection.verticalBottom,
      pieceColor,
    );
    if (bottomCells.isLeft()) return bottomCells.left;

    cells.addAll(bottomCells.right as Iterable<Cell>);

    // Left
    final leftCells = getFreeLinedCells(
      boardCell,
      directionLength,
      StraightDirection.horizontalLeft,
      pieceColor,
    );
    if (leftCells.isLeft()) return leftCells.left;

    cells.addAll(leftCells.right as Iterable<Cell>);

    // Right
    final rightCells = getFreeLinedCells(
      boardCell,
      directionLength,
      StraightDirection.horizontalRight,
      pieceColor,
    );
    if (rightCells.isLeft()) return rightCells.left;

    cells.addAll(rightCells.right as Iterable<Cell>);

    return Right(cells);
  }

  @visibleForTesting
  Either<Failure, Iterable<Cell>> getQueenMoves(Cell cell) {
    final horizontalCells = getRookMoves(cell, true);
    if (horizontalCells.isLeft()) return horizontalCells.left;

    final diagonalCells = getBishopMoves(cell, true);
    if (diagonalCells.isLeft()) return diagonalCells.left;

    return Right([...horizontalCells.right, ...diagonalCells.right]);
  }

  @visibleForTesting
  Either<Failure, Iterable<Cell>> getKingMoves(Cell cell) {
    final horizontalCells = getRookMoves(cell, true, 1);
    if (horizontalCells.isLeft()) return horizontalCells.left;

    final diagonalCells = getBishopMoves(cell, true, 1);
    if (diagonalCells.isLeft()) return diagonalCells.left;

    List<Cell> cells = [...horizontalCells.right, ...diagonalCells.right];

    // Add castling
    if (cell.piece!.moveTimes == 0) {
      final leftCastlingCells = _getCastlingCells(cell, false);
      if (leftCastlingCells.isLeft()) return leftCastlingCells.left;

      // Remove cells that are in the way of castling to avoid duplicates
      for (final currentCastlingCell
          in leftCastlingCells.right as Iterable<Cell>) {
        cells.removeWhere(
          (element) => element.coord == currentCastlingCell.coord,
        );
      }
      cells.addAll(leftCastlingCells.right as Iterable<Cell>);

      final rightCastlingCells = _getCastlingCells(cell, true);
      if (rightCastlingCells.isLeft()) return rightCastlingCells.left;

      // Remove cells that are in the way of castling to avoid duplicates
      for (final currentCastlingCell
          in rightCastlingCells.right as Iterable<Cell>) {
        cells.removeWhere(
          (element) => element.coord == currentCastlingCell.coord,
        );
      }
      cells.addAll(rightCastlingCells.right as Iterable<Cell>);
    }

    // Remove cells that are under attack
    cells.removeWhere(
      (element) => element.getEnemyControl(cell.piece!.color) > 0,
    );

    return Right(cells);
  }

  //#endregion

  //#region Private Helpers

  Either<Failure, Iterable<Cell>> _getCastlingCells(
    Cell cellRef,
    bool rightDirection,
  ) {
    final pieceColor = cellRef.piece!.color;

    // Check if king is under attack
    if (cellRef.getEnemyControl(pieceColor) > 0) return const Right([]);

    final rook = getCell('${rightDirection ? 'h' : 'a'}${cellRef.row}');
    final canCastle = rook.isRight() &&
        rook.right.piece is Rook &&
        rook.right.piece.color == pieceColor &&
        rook.right.piece!.moveTimes == 0;
    if (!canCastle) return const Right([]);

    // Check if cells between king and rook are empty
    final cells = getFreeLinedCells(
      cellRef,
      2,
      rightDirection
          ? StraightDirection.horizontalRight
          : StraightDirection.horizontalLeft,
      pieceColor,
    );
    if (cells.isLeft()) return cells.left;

    final leftCellsAreEmpty =
        cells.right.every((Cell element) => element.piece == null);
    if (!leftCellsAreEmpty) return const Right([]);

    // Check if cells between king and rook are under attack
    final cellsUnderAttack = cells.right
        .where((Cell element) => element.getEnemyControl(pieceColor) > 0);
    if (cellsUnderAttack.isNotEmpty) return const Right([]);

    return Right(cells.right);
  }

  @visibleForTesting
  Either<Failure, Iterable<Cell>> getFreeLinedCells(
    Cell cellRef,
    int moveLength,
    StraightDirection direction,
    PieceColor pieceColor,
  ) {
    final isHorizontal = direction == StraightDirection.horizontalLeft ||
        direction == StraightDirection.horizontalRight;
    final lengthAmount =
        moveLength * (isHorizontal ? direction.x : direction.y);

    List<Cell> cells = [];
    for (int i = 1; i <= lengthAmount.abs(); i++) {
      late String currentCoord;
      if (isHorizontal) {
        final currentColumn =
            letters.indexOf(cellRef.column) + (i * direction.x);
        if (currentColumn < 0 || currentColumn > 7) break;
        currentCoord = "${letters[currentColumn]}${cellRef.row}";
      } else {
        final currentRow = cellRef.row + (i * direction.y);
        if (currentRow < 1 || currentRow > 8) break;
        currentCoord = "${cellRef.column}$currentRow";
      }
      final cell = _getCellFromCoord(currentCoord);
      if (cell.isLeft()) return cell.left;
      if (cell.right.piece != null) {
        if (cell.right.piece!.color != pieceColor) {
          cells.add(cell.right);
        }
        break;
      }

      cells.add(cell.right);
    }

    return Right(cells);
  }

  @visibleForTesting
  Either<Failure, Iterable<Cell>> getFreeDiagonalCells(
    Cell cellRef,
    int moveLength,
    DiagonalDirection direction,
    PieceColor pieceColor,
  ) {
    List<Cell> cells = [];
    for (int i = 1; i <= moveLength; i++) {
      final currentRow = cellRef.row + (i * direction.y);
      final currentColumn = letters.indexOf(cellRef.column) + (i * direction.x);
      if (currentRow < 1 || currentRow > 8) break;
      if (currentColumn < 0 || currentColumn > 7) break;
      final currentCoord = "${letters[currentColumn]}$currentRow";
      final cell = _getCellFromCoord(currentCoord);
      if (cell.isLeft()) return cell.left;
      if (cell.right.piece != null) {
        if (cell.right.piece!.color != pieceColor) {
          cells.add(cell.right);
        }
        break;
      }

      cells.add(cell.right);
    }

    return Right(cells);
  }

  Either<Failure, Cell> _getCellFromCoord(String coord) {
    final cell = cells.firstWhereOrNull((e) => e.coord == coord);
    return cell != null
        ? Right(cell)
        : Left(CellNotFoundOnBoard('No cell found $coord'));
  }

  //#endregion
}
