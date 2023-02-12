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

  test("All diagonal Moves", () {
    final square = board.squares[4][4];
    square.piece = Bishop(color: PieceColor.white);
    final result = repo.pieceSelected(
      PieceSelectedParams(board: board, squareCoord: square.coord),
    );
    final expectedSquares = [
      "d5",
      "c6",
      "b7",
      "a8",
      "f5",
      "g6",
      "h7",
      "f3",
      "g2",
      "h1",
      "d3",
      "c2",
      "b1",
    ];
    expect(true, result.isRight());
    expect(13, result.getOrElse(() => []).length);
    for (final cell in expectedSquares) {
      expect(
        true,
        result.getOrElse(() => []).any((element) => element.coord == cell),
        reason: "Expected $cell",
      );
    }
  });

  test("Attack Enemy", () {
    final square = board.squares[7][7];
    square.piece = Bishop(color: PieceColor.white);
    board.squares[2][2].piece = Pawn(color: PieceColor.black);
    final result = repo.pieceSelected(
      PieceSelectedParams(board: board, squareCoord: square.coord),
    );
    final expectedSquares = [
      "g2",
      "f3",
      "e4",
      "d5",
      "c6",
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
  test("Ally Block", () {
    final square = board.squares[7][7];
    square.piece = Bishop(color: PieceColor.white);
    board.squares[2][2].piece = Pawn(color: PieceColor.white);
    final result = repo.pieceSelected(
      PieceSelectedParams(board: board, squareCoord: square.coord),
    );
    final expectedSquares = [
      "g2",
      "f3",
      "e4",
      "d5",
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
