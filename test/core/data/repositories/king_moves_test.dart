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
    square.piece = King(color: PieceColor.white);
    final result = repo.pieceSelected(
      PieceSelectedParams(board: board, squareCoord: square.coord),
    );
    final expectedSquares = [
      "e5",
      "f5",
      "f4",
      "f3",
      "e3",
      "d3",
      "d4",
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

  test("Attack Enemy", () {
    final square = board.squares[4][4];
    square.piece = King(color: PieceColor.white);
    board.squares[5][4].piece = Pawn(color: PieceColor.black);
    final result = repo.pieceSelected(
      PieceSelectedParams(board: board, squareCoord: square.coord),
    );
    final expectedSquares = [
      "e5",
      "f5",
      "f4",
      "f3",
      "e3",
      "d3",
      "d4",
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

  test("Attack Ally", () {
    final square = board.squares[4][4];
    square.piece = King(color: PieceColor.white);
    board.squares[5][4].piece = Pawn(color: PieceColor.white);
    final result = repo.pieceSelected(
      PieceSelectedParams(board: board, squareCoord: square.coord),
    );
    final expectedSquares = [
      "e5",
      "f5",
      "f4",
      "f3",
      "d3",
      "d4",
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

  test("Avoid Cells controlled by enemy", () {
    final square = board.squares[4][4];
    square.piece = King(color: PieceColor.white);
    board.squares[2][4].piece = Pawn(color: PieceColor.black);
    board.squares[3][3].blackControl++;
    board.squares[3][5].blackControl++;
    final result = repo.pieceSelected(
      PieceSelectedParams(board: board, squareCoord: square.coord),
    );
    final expectedSquares = [
      "e5",
      "f4",
      "f3",
      "e3",
      "d3",
      "d4",
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

  test("Right Castling", () {
    final square = board.squares[7][4];
    square.piece = King(color: PieceColor.white);
    board.squares[7][7].piece = Rook(color: PieceColor.white);
    final result = repo.pieceSelected(
      PieceSelectedParams(board: board, squareCoord: square.coord),
    );
    final expectedSquares = [
      "g1",
      "f1",
      "f2",
      "e2",
      "e2",
      "d2",
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

  test("Left Castling", () {
    final square = board.squares[7][4];
    square.piece = King(color: PieceColor.white);
    board.squares[7][0].piece = Rook(color: PieceColor.white);
    final result = repo.pieceSelected(
      PieceSelectedParams(board: board, squareCoord: square.coord),
    );
    final expectedSquares = [
      "c1",
      "d1",
      "e2",
      "d2",
      "f2",
      "f1",
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

  test("Avoid Castling if King moved", () {
    final square = board.squares[7][4];
    square.piece = King(color: PieceColor.white);
    board.squares[7][7].piece = Rook(color: PieceColor.white);
    square.piece!.totalMoves = 2;
    final result = repo.pieceSelected(
      PieceSelectedParams(board: board, squareCoord: square.coord),
    );
    final expectedSquares = [
      "f1",
      "f2",
      "e2",
      "d2",
      "d1",
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

  test("Avoid Castling if Rook moved", () {
    final square = board.squares[7][4];
    square.piece = King(color: PieceColor.white);
    board.squares[7][7].piece = Rook(color: PieceColor.white);
    board.squares[7][7].piece!.totalMoves = 2;
    final result = repo.pieceSelected(
      PieceSelectedParams(board: board, squareCoord: square.coord),
    );
    final expectedSquares = [
      "f1",
      "f2",
      "e2",
      "d2",
      "d1",
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

  test("Avoid Castling cause enemy controlling king cells", () {
    final square = board.squares[7][4];
    square.piece = King(color: PieceColor.white);
    board.squares[7][7].piece = Rook(color: PieceColor.white);
    board.squares[7][5].blackControl++;
    final result = repo.pieceSelected(
      PieceSelectedParams(board: board, squareCoord: square.coord),
    );
    final expectedSquares = [
      "f2",
      "e2",
      "d2",
      "d1",
    ];
    expect(true, result.isRight());
    expect(
      expectedSquares.length,
      result.getOrElse(() => []).length,
      reason:
          "Expected $expectedSquares but got ${result.getOrElse(() => []).map((e) => e.coord).toList()}",
    );
    for (final cell in expectedSquares) {
      expect(
        true,
        result.getOrElse(() => []).any((element) => element.coord == cell),
        reason: "Expected $cell",
      );
    }
  });
}
