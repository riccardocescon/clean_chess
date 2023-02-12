import 'package:clean_chess/core/utilities/enums.dart';
import 'package:clean_chess/features/clean_chess/data/models/board.dart';
import 'package:clean_chess/features/clean_chess/data/models/piece.dart';
import 'package:clean_chess/features/clean_chess/data/repositories/board_repository_impl.dart';
import 'package:clean_chess/features/clean_chess/domain/entities/piece_selected_params.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../setup.dart';

void main() {
  late Board board;
  late BoardRepositoryImpl repo;

  setUp(() {
    board = setupEmptyBoard();
    repo = BoardRepositoryImpl();
  });

  test("All Moves", () {
    final square = board.squares[4][4];
    square.piece = Rook(color: PieceColor.white);
    final result = repo.pieceSelected(
      PieceSelectedParams(board: board, squareCoord: square.coord),
    );
    final expectedSquares = [
      "a4",
      "b4",
      "c4",
      "d4",
      "f4",
      "g4",
      "h4",
      "e1",
      "e2",
      "e3",
      "e5",
      "e6",
      "e7",
      "e8",
    ];
    expect(true, result.isRight());
    expect(expectedSquares.length, result.getOrElse(() => []).length);
    for (final cell in expectedSquares) {
      expect(
        true,
        result.getOrElse(() => []).any((element) => element.coord == cell),
        reason: "Expected $cell",
      );
    }
  });

  test("Attack Enemy", () {
    final square = board.squares[4][4];
    square.piece = Rook(color: PieceColor.white);
    board.squares[1][4].piece = Pawn(color: PieceColor.black);
    final result = repo.pieceSelected(
      PieceSelectedParams(board: board, squareCoord: square.coord),
    );
    final expectedSquares = [
      "a4",
      "b4",
      "c4",
      "d4",
      "f4",
      "g4",
      "h4",
      "e1",
      "e2",
      "e3",
      "e5",
      "e6",
      "e7",
    ];
    expect(true, result.isRight());
    expect(expectedSquares.length, result.getOrElse(() => []).length);
    for (final cell in expectedSquares) {
      expect(
        true,
        result.getOrElse(() => []).any((element) => element.coord == cell),
        reason: "Expected $cell",
      );
    }
  });

  test("Block Friendly", () {
    final square = board.squares[4][4];
    square.piece = Rook(color: PieceColor.white);
    board.squares[1][4].piece = Pawn(color: PieceColor.white);
    final result = repo.pieceSelected(
      PieceSelectedParams(board: board, squareCoord: square.coord),
    );
    final expectedSquares = [
      "a4",
      "b4",
      "c4",
      "d4",
      "f4",
      "g4",
      "h4",
      "e1",
      "e2",
      "e3",
      "e5",
      "e6",
    ];
    expect(true, result.isRight());
    expect(expectedSquares.length, result.getOrElse(() => []).length);
    for (final cell in expectedSquares) {
      expect(
        true,
        result.getOrElse(() => []).any((element) => element.coord == cell),
        reason: "Expected $cell",
      );
    }
  });
}
