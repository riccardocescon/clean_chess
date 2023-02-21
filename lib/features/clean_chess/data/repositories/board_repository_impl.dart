import 'package:clean_chess/features/clean_chess/data/models/board.dart';
import 'package:clean_chess/features/clean_chess/data/models/piece.dart';
import 'package:clean_chess/features/clean_chess/domain/entities/piece_selected_params.dart';
import 'package:clean_chess/features/clean_chess/data/models/square.dart';
import 'package:clean_chess/core/error/failures.dart';
import 'package:clean_chess/features/clean_chess/domain/repositories/board_repository.dart';
import 'package:clean_chess/features/clean_chess/presentation/bloc/board_event.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_chess/core/utilities/extensions.dart';

import '../../../../core/utilities/enums.dart';

class BoardRepositoryImpl implements BoardRepository {
  @override
  Either<Failure, Iterable<Square>> pieceSelected(
    PieceSelectedParams params,
  ) {
    final board = params.board;
    final square = board.squares.expand((element) => element).firstWhere(
          (square) => square.coord == params.squareCoord,
        );
    final piece = square.piece!;
    if (piece.color != board.colorTurn) {
      return const Left(InvalidMoveFailure("It's not your turn"));
    }
    if (piece is Pawn) {
      return _getPawnMoves(board, square);
    } else if (piece is Bishop) {
      return _getBishopMoves(board, square);
    } else if (piece is Rook) {
      return _getRookMoves(board, square);
    } else if (piece is Knight) {
      return _getKnightMoves(board, square);
    } else if (piece is Queen) {
      return _getQueenMoves(board, square);
    } else if (piece is King) {
      return _getKingMoves(board, square);
    }

    throw UnimplementedError();
  }

  Either<Failure, Iterable<Square>> _getPawnMoves(Board board, Square square) {
    final moveLength = (square.piece! as Pawn).hasMoved ? 1 : 2;
    final direction = square.piece!.color == PieceColor.white
        ? StraightDirection.verticalTop
        : StraightDirection.verticalBottom;
    final forwardCells = board.squares.line(
      square.coord,
      direction,
      moveLength,
    );

    final List<Square> squares = [];

    for (final cell in forwardCells) {
      if (cell.piece != null) {
        break;
      }
      squares.add(cell);
    }

    // Add diagonal moves
    final diagonalLeft = board.squares.offsetSquare(
      square.coord,
      -1,
      direction.y,
    );
    final diagonalRight = board.squares.offsetSquare(
      square.coord,
      1,
      direction.y,
    );
    if (diagonalLeft?.piece?.color == square.piece!.color.opposite) {
      squares.add(diagonalLeft!);
    }
    if (diagonalRight?.piece?.color == square.piece!.color.opposite) {
      squares.add(diagonalRight!);
    }

    // Add en passant
    final enPassantLeft = board.squares.offsetSquare(
      square.coord,
      -1,
      0,
    );
    final enPassantRight = board.squares.offsetSquare(
      square.coord,
      1,
      0,
    );
    if (enPassantLeft?.piece is Pawn) {
      final pawn = enPassantLeft!.piece as Pawn;
      final enPassant =
          pawn.color == square.piece!.color.opposite && pawn.totalMoves == 1;
      if (enPassant) {
        final leftEnPassantCell = board.squares.offsetSquare(
          square.coord,
          -1,
          direction.y,
        );
        squares.add(leftEnPassantCell!);
      }
    }
    if (enPassantRight?.piece is Pawn) {
      final pawn = enPassantRight!.piece as Pawn;
      final enPassant =
          pawn.color == square.piece!.color.opposite && pawn.totalMoves == 1;
      if (enPassant) {
        final rightEnPassantCell = board.squares.offsetSquare(
          square.coord,
          1,
          direction.y,
        );
        squares.add(rightEnPassantCell!);
      }
    }

    return Right(squares);
  }

  Either<Failure, Iterable<Square>> _getBishopMoves(
    Board board,
    Square square,
  ) {
    final List<Square> squares = [];

    for (final diagonal in DiagonalDirection.values) {
      final cells = board.squares.diagonal(
        square.coord,
        diagonal,
        8,
      );
      for (final cell in cells) {
        if (cell.piece == null) {
          squares.add(cell);
          continue;
        }

        if (cell.piece!.color != square.piece!.color) {
          squares.add(cell);
        }
        break;
      }
    }

    return Right(squares);
  }

  Either<Failure, Iterable<Square>> _getRookMoves(Board board, Square square) {
    final List<Square> squares = [];

    for (final straight in StraightDirection.values) {
      final cells = board.squares.line(
        square.coord,
        straight,
        8,
      );
      for (final cell in cells) {
        if (cell.piece == null) {
          squares.add(cell);
          continue;
        }

        if (cell.piece!.color != square.piece!.color) {
          squares.add(cell);
        }
        break;
      }
    }

    return Right(squares);
  }

  Either<Failure, Iterable<Square>> _getKnightMoves(
    Board board,
    Square square,
  ) {
    final List<Square> squares = [];

    for (final knightMove in KnightDirection.values) {
      final cell = board.squares.offsetSquare(
        square.coord,
        knightMove.x,
        knightMove.y,
      );
      if (cell == null) {
        continue;
      }

      if (cell.piece == null) {
        squares.add(cell);
        continue;
      }

      if (cell.piece!.color != square.piece!.color) {
        squares.add(cell);
      }
    }

    return Right(squares);
  }

  Either<Failure, Iterable<Square>> _getQueenMoves(
          Board board, Square square) =>
      _allDirections(board, square, 8);

  Either<Failure, Iterable<Square>> _getKingMoves(Board board, Square square) {
    final eCells = _allDirections(board, square, 1);
    if (eCells.isLeft()) return eCells;

    final List<Square> squares = eCells.getOrElse(() => []);

    // add castling
    final mayCastle = !square.piece!.hasMoved &&
        !square.isControlledBy(square.piece!.color.opposite);
    if (mayCastle) {
      final rookLeft =
          board.squares.expand((element) => element).firstWhereOrNull(
                (element) =>
                    element.piece is Rook &&
                    element.piece!.color == square.piece!.color &&
                    element.piece!.hasMoved == false &&
                    element.coord[0] == "a",
              );
      if (rookLeft != null) {
        final cells = board.squares.line(
          square.coord,
          StraightDirection.horizontalLeft,
          2,
        );
        final safeCells = cells.every(
          (element) =>
              element.piece == null &&
              !element.isControlledBy(square.piece!.color.opposite),
        );
        if (safeCells) {
          squares.add(cells.last);
        }
      }

      final rookRight =
          board.squares.expand((element) => element).firstWhereOrNull(
                (element) =>
                    element.piece is Rook &&
                    element.piece!.color == square.piece!.color &&
                    element.piece!.hasMoved == false &&
                    element.coord[0] == "h",
              );
      if (rookRight != null) {
        final cells = board.squares.line(
          square.coord,
          StraightDirection.horizontalRight,
          2,
        );
        final safeCells = cells.every(
          (element) =>
              element.piece == null &&
              !element.isControlledBy(square.piece!.color.opposite),
        );
        if (safeCells) {
          squares.add(cells.last);
        }
      }
    }

    // remove squares under attack
    squares.removeWhere(
      (element) => element.isControlledBy(square.piece!.color.opposite),
    );

    return Right(squares);
  }

  Either<Failure, List<Square>> _allDirections(
    Board board,
    Square square,
    int length,
  ) {
    final List<Square> squares = [];

    for (final straight in StraightDirection.values) {
      final cells = board.squares.line(
        square.coord,
        straight,
        length,
      );
      for (final cell in cells) {
        if (cell.piece == null) {
          squares.add(cell);
          continue;
        }

        if (cell.piece!.color != square.piece!.color) {
          squares.add(cell);
        }
        break;
      }
    }

    for (final diagonal in DiagonalDirection.values) {
      final cells = board.squares.diagonal(
        square.coord,
        diagonal,
        length,
      );
      for (final cell in cells) {
        if (cell.piece == null) {
          squares.add(cell);
          continue;
        }

        if (cell.piece!.color != square.piece!.color) {
          squares.add(cell);
        }
        break;
      }
    }

    return Right(squares);
  }

  @override
  Either<Failure, bool> pieceMove(PieceMoveEvent params) {
    // {f2g3} {e6e7} {b2b1} {b3c1} {b1c1} {h6c1}
    final board = params.board;
    final movement = params.movement;

    final startingMovement = movement.substring(0, 2);
    final endingMovement = movement.substring(2);

    if (startingMovement == endingMovement) {
      return const Left(InvalidMoveFailure("Cannot move to same square"));
    }

    final startingSquare =
        board.squares.expand((element) => element).firstWhere(
              (element) => element.coord == startingMovement,
            );

    if (startingSquare.piece == null) {
      return const Left(InvalidMoveFailure("No piece on starting square"));
    }

    final piece = startingSquare.piece!;

    if (piece.color != board.colorTurn) {
      return const Left(InvalidMoveFailure("Not your turn"));
    }

    final controlledSquares = pieceSelected(
      PieceSelectedParams(
        board: board,
        squareCoord: startingMovement,
      ),
    );

    final validMove = controlledSquares.getOrElse(() => []).any(
          (element) => element.coord == endingMovement,
        );

    if (!validMove) {
      return const Left(InvalidMoveFailure("Piece cannot move to that square"));
    }

    for (final cell in controlledSquares.getOrElse(() => [])) {
      if (piece.color == PieceColor.white) {
        cell.whiteControl--;
      } else {
        cell.blackControl--;
      }
    }

    startingSquare.piece = null;

    final endingSquare = board.squares.expand((element) => element).firstWhere(
          (element) => element.coord == endingMovement,
        );

    if (endingSquare.piece != null) {
      final enemyControlledSquares = pieceSelected(
        PieceSelectedParams(
          board: board,
          squareCoord: endingMovement,
        ),
      );

      for (final cell in enemyControlledSquares.getOrElse(() => [])) {
        if (endingSquare.piece!.color == PieceColor.white) {
          cell.whiteControl--;
        } else {
          cell.blackControl--;
        }
      }
    }

    endingSquare.piece = piece;
    final newControlledSquares = pieceSelected(
      PieceSelectedParams(
        board: board,
        squareCoord: endingMovement,
      ),
    );

    for (final cell in newControlledSquares.getOrElse(() => [])) {
      if (piece.color == PieceColor.white) {
        cell.whiteControl++;
      } else {
        cell.blackControl++;
      }
    }

    board.pieceMoved();

    return const Right(true);
  }
}
