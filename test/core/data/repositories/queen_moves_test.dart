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
    square.piece = Queen(color: PieceColor.white);
    final result = repo.pieceSelected(
      PieceSelectedParams(board: board, squareCoord: square.coord),
    );
    final expectedSquares = [
      "e5",
      "e6",
      "e7",
      "e8",
      "f5",
      "g6",
      "h7",
      "f4",
      "g4",
      "h4",
      "a4",
      "b4",
      "c4",
      "d4",
      "e1",
      "e2",
      "e3",
      "d5",
      "c6",
      "b7",
      "a8",
      "d3",
      "c2",
      "b1",
      "f3",
      "g2",
      "h1",
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
    square.piece = Queen(color: PieceColor.white);
    board.squares[1][4].piece = Pawn(color: PieceColor.black);
    final result = repo.pieceSelected(
      PieceSelectedParams(board: board, squareCoord: square.coord),
    );
    final expectedSquares = [
      "e5",
      "e6",
      "e7",
      "f5",
      "g6",
      "h7",
      "f4",
      "g4",
      "h4",
      "a4",
      "b4",
      "c4",
      "d4",
      "e1",
      "e2",
      "e3",
      "d5",
      "c6",
      "b7",
      "a8",
      "d3",
      "c2",
      "b1",
      "f3",
      "g2",
      "h1",
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

  test("Attack Ally", () {
    final square = board.squares[4][4];
    square.piece = Queen(color: PieceColor.white);
    board.squares[1][4].piece = Pawn(color: PieceColor.white);
    final result = repo.pieceSelected(
      PieceSelectedParams(board: board, squareCoord: square.coord),
    );
    final expectedSquares = [
      "e5",
      "e6",
      "f5",
      "g6",
      "h7",
      "f4",
      "g4",
      "h4",
      "a4",
      "b4",
      "c4",
      "d4",
      "e1",
      "e2",
      "e3",
      "d5",
      "c6",
      "b7",
      "a8",
      "d3",
      "c2",
      "b1",
      "f3",
      "g2",
      "h1",
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
