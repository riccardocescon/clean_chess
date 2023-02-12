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
    square.piece = Knight(color: PieceColor.white);
    final result = repo.pieceSelected(
      PieceSelectedParams(board: board, squareCoord: square.coord),
    );
    final expectedSquares = [
      "f6",
      "g5",
      "g3",
      "f2",
      "d2",
      "c3",
      "c5",
      "d6",
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
    square.piece = Knight(color: PieceColor.white);
    board.squares[5][6].piece = Pawn(color: PieceColor.black);
    final result = repo.pieceSelected(
      PieceSelectedParams(board: board, squareCoord: square.coord),
    );
    final expectedSquares = [
      "f6",
      "g5",
      "g3",
      "f2",
      "d2",
      "c3",
      "c5",
      "d6",
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

  test("Block Ally", () {
    final square = board.squares[4][4];
    square.piece = Knight(color: PieceColor.white);
    board.squares[5][6].piece = Pawn(color: PieceColor.white);
    final result = repo.pieceSelected(
      PieceSelectedParams(board: board, squareCoord: square.coord),
    );
    final expectedSquares = [
      "f6",
      "g5",
      "f2",
      "d2",
      "c3",
      "c5",
      "d6",
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
