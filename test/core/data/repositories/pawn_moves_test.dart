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
  group("White Pawn", () {
    test("Fist doubled move", () {
      final square = board.squares[6][4];
      square.piece = Pawn(color: PieceColor.white);
      final result = repo.pieceSelected(
        PieceSelectedParams(board: board, squareCoord: square.coord),
      );
      expect(true, result.isRight());
      expect(2, result.getOrElse(() => []).length);
      expect("e3", result.getOrElse(() => []).first.coord);
      expect("e4", result.getOrElse(() => []).last.coord);
    });

    test("Straight vertical move", () {
      final square = board.squares[5][4];
      square.piece = Pawn(color: PieceColor.white);
      square.piece!.totalMoves = 1;
      final result = repo.pieceSelected(
        PieceSelectedParams(board: board, squareCoord: square.coord),
      );
      expect(true, result.isRight());
      expect(1, result.getOrElse(() => []).length);
      expect("e4", result.getOrElse(() => []).first.coord);
    });

    test("No move", () {
      final square = board.squares[5][4];
      square.piece = Pawn(color: PieceColor.white);
      square.piece!.totalMoves = 1;
      board.squares[4][4].piece = Pawn(color: PieceColor.black);
      final result = repo.pieceSelected(
        PieceSelectedParams(board: board, squareCoord: square.coord),
      );
      expect(true, result.isRight());
      expect(0, result.getOrElse(() => []).length);
    });

    test("Diagonal move", () {
      final square = board.squares[5][4];
      square.piece = Pawn(color: PieceColor.white);
      square.piece!.totalMoves = 1;
      board.squares[4][4].piece = Pawn(color: PieceColor.black);
      board.squares[4][3].piece = Pawn(color: PieceColor.black);
      final result = repo.pieceSelected(
        PieceSelectedParams(board: board, squareCoord: square.coord),
      );
      expect(true, result.isRight());
      expect(1, result.getOrElse(() => []).length);
      expect("d4", result.getOrElse(() => []).first.coord);
    });

    test("No move, diagonal friendly unit", () {
      final square = board.squares[5][4];
      square.piece = Pawn(color: PieceColor.white);
      square.piece!.totalMoves = 1;
      board.squares[4][4].piece = Pawn(color: PieceColor.black);
      board.squares[4][3].piece = Pawn(color: PieceColor.white);
      final result = repo.pieceSelected(
        PieceSelectedParams(board: board, squareCoord: square.coord),
      );
      expect(true, result.isRight());
      expect(0, result.getOrElse(() => []).length);
    });

    test("En passant", () {
      final square = board.squares[3][4];
      square.piece = Pawn(color: PieceColor.white);
      square.piece!.totalMoves = 2;
      board.squares[3][3].piece = Pawn(color: PieceColor.black);
      board.squares[3][3].piece!.totalMoves = 1;
      final result = repo.pieceSelected(
        PieceSelectedParams(board: board, squareCoord: square.coord),
      );
      expect(true, result.isRight());
      expect(2, result.getOrElse(() => []).length);
      expect("e6", result.getOrElse(() => []).first.coord);
      expect("d6", result.getOrElse(() => []).last.coord);
    });

    test("No Friendly En Passant", () {
      final square = board.squares[3][4];
      square.piece = Pawn(color: PieceColor.white);
      square.piece!.totalMoves = 2;
      board.squares[3][3].piece = Pawn(color: PieceColor.white);
      board.squares[3][3].piece!.totalMoves = 1;
      final result = repo.pieceSelected(
        PieceSelectedParams(board: board, squareCoord: square.coord),
      );
      expect(true, result.isRight());
      expect(1, result.getOrElse(() => []).length);
      expect("e6", result.getOrElse(() => []).first.coord);
    });
  });

  group("Black Moves", () {
    test("First doubled move", () {
      final square = board.squares[1][4];
      square.piece = Pawn(color: PieceColor.black);
      final result = repo.pieceSelected(
        PieceSelectedParams(board: board, squareCoord: square.coord),
      );
      expect(true, result.isRight());
      expect(2, result.getOrElse(() => []).length);
      expect("e6", result.getOrElse(() => []).first.coord);
      expect("e5", result.getOrElse(() => []).last.coord);
    });

    test("Straight vertical move", () {
      final square = board.squares[2][4];
      square.piece = Pawn(color: PieceColor.black);
      square.piece!.totalMoves = 1;
      final result = repo.pieceSelected(
        PieceSelectedParams(board: board, squareCoord: square.coord),
      );
      expect(true, result.isRight());
      expect(1, result.getOrElse(() => []).length);
      expect("e5", result.getOrElse(() => []).first.coord);
    });

    test("No move", () {
      final square = board.squares[2][4];
      square.piece = Pawn(color: PieceColor.black);
      square.piece!.totalMoves = 1;
      board.squares[3][4].piece = Pawn(color: PieceColor.white);
      final result = repo.pieceSelected(
        PieceSelectedParams(board: board, squareCoord: square.coord),
      );
      expect(true, result.isRight());
      expect(0, result.getOrElse(() => []).length);
    });

    test("Diagonal move", () {
      final square = board.squares[2][4];
      square.piece = Pawn(color: PieceColor.black);
      square.piece!.totalMoves = 1;
      board.squares[3][4].piece = Pawn(color: PieceColor.white);
      board.squares[3][3].piece = Pawn(color: PieceColor.white);
      final result = repo.pieceSelected(
        PieceSelectedParams(board: board, squareCoord: square.coord),
      );
      expect(true, result.isRight());
      expect(1, result.getOrElse(() => []).length);
      expect("d5", result.getOrElse(() => []).first.coord);
    });

    test("No move, diagonal friendly unit", () {
      final square = board.squares[2][4];
      square.piece = Pawn(color: PieceColor.black);
      square.piece!.totalMoves = 1;
      board.squares[3][4].piece = Pawn(color: PieceColor.white);
      board.squares[3][3].piece = Pawn(color: PieceColor.black);
      final result = repo.pieceSelected(
        PieceSelectedParams(board: board, squareCoord: square.coord),
      );
      expect(true, result.isRight());
      expect(0, result.getOrElse(() => []).length);
    });

    test("En passant", () {
      final square = board.squares[4][4];
      square.piece = Pawn(color: PieceColor.black);
      square.piece!.totalMoves = 2;
      board.squares[4][3].piece = Pawn(color: PieceColor.white);
      board.squares[4][3].piece!.totalMoves = 1;
      final result = repo.pieceSelected(
        PieceSelectedParams(board: board, squareCoord: square.coord),
      );
      expect(true, result.isRight());
      expect(2, result.getOrElse(() => []).length);
      expect("e3", result.getOrElse(() => []).first.coord);
      expect("d3", result.getOrElse(() => []).last.coord);
    });

    test("No Friendly En Passant", () {
      final square = board.squares[4][4];
      square.piece = Pawn(color: PieceColor.black);
      square.piece!.totalMoves = 2;
      board.squares[4][3].piece = Pawn(color: PieceColor.black);
      board.squares[4][3].piece!.totalMoves = 1;
      final result = repo.pieceSelected(
        PieceSelectedParams(board: board, squareCoord: square.coord),
      );
      expect(true, result.isRight());
      expect(1, result.getOrElse(() => []).length);
      expect("e3", result.getOrElse(() => []).first.coord);
    });
  });
}
