import 'package:clean_chess/chess/apis/puzzle_board_api.dart';
import 'package:clean_chess/chess/error/failures.dart';
import 'package:clean_chess/chess/models/board.dart';
import 'package:clean_chess/chess/models/cell.dart';
import 'package:clean_chess/chess/models/fen.dart';
import 'package:clean_chess/chess/models/pieces.dart';
import 'package:clean_chess/chess/utilities/extensions.dart';
import 'package:clean_chess/chess/core/utilities/enums.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Board board;

  setUp(() => board = Board.empty());

  group("Get Lined Cells", () {
    test("White Pawn First Move", () {
      final cell = board.cells.firstWhere((element) => element.coord == 'e2');

      final cells = board.getFreeLinedCells(
        cell,
        2,
        StraightDirection.verticalTop,
        PieceColor.white,
      );

      expect(cells.isRight(), true);
      expect(cells.right.length, 2);
      expect(cells.right.first.coord, 'e3');
      expect(cells.right.last.coord, 'e4');
    });
    test("Black Pawn First Move", () {
      final cell = board.cells.firstWhere((element) => element.coord == 'e7');

      final cells = board.getFreeLinedCells(
        cell,
        2,
        StraightDirection.verticalBottom,
        PieceColor.black,
      );

      expect(cells.isRight(), true);
      expect(cells.right.length, 2);
      expect(cells.right.first.coord, 'e6');
      expect(cells.right.last.coord, 'e5');
    });

    test("Rook 4 Move", () {
      final cell = board.cells.firstWhere((element) => element.coord == 'e4');

      final cells = board.getFreeLinedCells(
        cell,
        4,
        StraightDirection.horizontalRight,
        PieceColor.white,
      );

      expect(cells.isRight(), true);
      expect(cells.right.length, 3);
      expect(cells.right.first.coord, 'f4');
      expect(cells.right.elementAt(1).coord, 'g4');
      expect(cells.right.last.coord, 'h4');
    });
  });

  group("Get Diagonal Cells", () {
    test("White Bishop 4 Move", () {
      final cell = board.cells.firstWhere((element) => element.coord == 'e4');

      final cells = board.getFreeDiagonalCells(
        cell,
        4,
        DiagonalDirection.topRight,
        PieceColor.white,
      );

      expect(cells.isRight(), true);
      expect(cells.right.length, 3);
      expect(cells.right.first.coord, 'f5');
      expect(cells.right.elementAt(1).coord, 'g6');
      expect(cells.right.last.coord, 'h7');
    });
    test("Black Bishop 4 Move", () {
      final cell = board.cells.firstWhere((element) => element.coord == 'e4');

      final cells = board.getFreeDiagonalCells(
        cell,
        4,
        DiagonalDirection.bottomRight,
        PieceColor.black,
      );

      expect(cells.isRight(), true);
      expect(cells.right.length, 3);
      expect(cells.right.first.coord, 'f3');
      expect(cells.right.elementAt(1).coord, 'g2');
      expect(cells.right.last.coord, 'h1');
    });
  });

  group("Pieces Movement", () {
    group("Get Pawn Moves", () {
      test("First Pawn Move", () {
        final e2 = board.cells.firstWhere((element) => element.coord == 'e2');
        e2.piece = Pawn(PieceColor.white);

        final result = board.getPawnMoves(e2);

        expect(result.isRight(), true);
        expect(result.right.length, 2);
        expect(result.right.first.coord, 'e3');
        expect(result.right.last.coord, 'e4');
      });

      test("Pawn Forward Enemy Move", () {
        final e2 = board.cells.firstWhere((element) => element.coord == 'e2');
        e2.piece = Pawn(PieceColor.white);
        final e3 = board.cells.firstWhere((element) => element.coord == 'e3');
        e3.piece = Queen(PieceColor.black);

        final result = board.getPawnMoves(e2);

        expect(result.isRight(), true);
        expect(result.right.length, 0);
      });

      test("White Pawn Diagonal Move", () {
        final e2 = board.cells.firstWhere((element) => element.coord == 'e2');
        e2.piece = Pawn(PieceColor.white);
        final f3 = board.cells.firstWhere((element) => element.coord == 'f3');
        f3.piece = Pawn(PieceColor.black);

        final result = board.getPawnMoves(e2);

        expect(result.isRight(), true);
        expect(result.right.length, 3);
        expect(result.right.first.coord, 'e3');
        expect(result.right.elementAt(1).coord, 'e4');
        expect(result.right.last.coord, 'f3');
      });

      test("Black Pawn Diagonal Move", () {
        final e7 = board.cells.firstWhere((element) => element.coord == 'e7');
        e7.piece = Pawn(PieceColor.black);
        final f6 = board.cells.firstWhere((element) => element.coord == 'f6');
        f6.piece = Pawn(PieceColor.white);

        final result = board.getPawnMoves(e7);

        expect(result.isRight(), true);
        expect(result.right.length, 3);
        expect(result.right.first.coord, 'e6');
        expect(result.right.elementAt(1).coord, 'e5');
        expect(result.right.last.coord, 'f6');
      });

      test("White En Passant", () {
        final e5 = board.cells.firstWhere((element) => element.coord == 'e5');
        e5.piece = Pawn(PieceColor.white);
        e5.piece!.setMoveTimes = 2;
        final f5 = board.cells.firstWhere((element) => element.coord == 'f5');
        f5.piece = Pawn(PieceColor.black);
        f5.piece!.setMoveTimes = 1;

        final result = board.getPawnMoves(e5);

        expect(result.isRight(), true);
        expect(result.right.length, 2);
        expect(result.right.first.coord, 'e6');
        expect(result.right.last.coord, 'f6');
      });

      test("Black En Passant", () {
        final e4 = board.cells.firstWhere((element) => element.coord == 'e4');
        e4.piece = Pawn(PieceColor.black);
        e4.piece!.setMoveTimes = 2;
        final f4 = board.cells.firstWhere((element) => element.coord == 'f4');
        f4.piece = Pawn(PieceColor.white);
        f4.piece!.setMoveTimes = 1;

        final result = board.getPawnMoves(e4);

        expect(result.isRight(), true);
        expect(result.right.length, 2);
        expect(result.right.first.coord, 'e3');
        expect(result.right.last.coord, 'f3');
      });
    });

    group("Get Knight Moves", () {
      test("All Free Directions", () {
        final e4 = board.cells.firstWhere((element) => element.coord == 'e4');
        e4.piece = Knight(PieceColor.white);

        final result = board.getKnightMoves(e4);

        expect(result.isRight(), true);
        final cells = result.right as Iterable<Cell>;
        expect(cells.length, 8);
        expect(cells.map((e) => e.coord).contains("f6"), true);
        expect(cells.map((e) => e.coord).contains("g5"), true);
        expect(cells.map((e) => e.coord).contains("g3"), true);
        expect(cells.map((e) => e.coord).contains("f2"), true);
        expect(cells.map((e) => e.coord).contains("d2"), true);
        expect(cells.map((e) => e.coord).contains("c3"), true);
        expect(cells.map((e) => e.coord).contains("c5"), true);
        expect(cells.map((e) => e.coord).contains("d6"), true);
      });

      test("Enemy Blocked Directions", () {
        final e4 = board.cells.firstWhere((element) => element.coord == 'e4');
        e4.piece = Knight(PieceColor.white);
        final f6 = board.cells.firstWhere((element) => element.coord == 'f6');
        f6.piece = Pawn(PieceColor.black);
        final g5 = board.cells.firstWhere((element) => element.coord == 'g5');
        g5.piece = Pawn(PieceColor.black);
        final g3 = board.cells.firstWhere((element) => element.coord == 'g3');
        g3.piece = Pawn(PieceColor.black);
        final f2 = board.cells.firstWhere((element) => element.coord == 'f2');
        f2.piece = Pawn(PieceColor.black);
        final d2 = board.cells.firstWhere((element) => element.coord == 'd2');
        d2.piece = Pawn(PieceColor.black);
        final c3 = board.cells.firstWhere((element) => element.coord == 'c3');
        c3.piece = Pawn(PieceColor.black);
        final c5 = board.cells.firstWhere((element) => element.coord == 'c5');
        c5.piece = Pawn(PieceColor.black);
        final d6 = board.cells.firstWhere((element) => element.coord == 'd6');
        d6.piece = Pawn(PieceColor.black);

        final result = board.getKnightMoves(e4);

        expect(result.isRight(), true);
        final cells = result.right as Iterable<Cell>;
        expect(cells.length, 8);
        expect(cells.map((e) => e.coord).contains("f6"), true);
        expect(cells.map((e) => e.coord).contains("g5"), true);
        expect(cells.map((e) => e.coord).contains("g3"), true);
        expect(cells.map((e) => e.coord).contains("f2"), true);
        expect(cells.map((e) => e.coord).contains("d2"), true);
        expect(cells.map((e) => e.coord).contains("c3"), true);
        expect(cells.map((e) => e.coord).contains("c5"), true);
        expect(cells.map((e) => e.coord).contains("d6"), true);
      });

      test("Ally Blocked Directions", () {
        final e4 = board.cells.firstWhere((element) => element.coord == 'e4');
        e4.piece = Knight(PieceColor.white);
        final f6 = board.cells.firstWhere((element) => element.coord == 'f6');
        f6.piece = Pawn(PieceColor.white);
        final g5 = board.cells.firstWhere((element) => element.coord == 'g5');
        g5.piece = Pawn(PieceColor.white);
        final g3 = board.cells.firstWhere((element) => element.coord == 'g3');
        g3.piece = Pawn(PieceColor.white);
        final f2 = board.cells.firstWhere((element) => element.coord == 'f2');
        f2.piece = Pawn(PieceColor.white);
        final d2 = board.cells.firstWhere((element) => element.coord == 'd2');
        d2.piece = Pawn(PieceColor.white);
        final c3 = board.cells.firstWhere((element) => element.coord == 'c3');
        c3.piece = Pawn(PieceColor.white);
        final c5 = board.cells.firstWhere((element) => element.coord == 'c5');
        c5.piece = Pawn(PieceColor.white);
        final d6 = board.cells.firstWhere((element) => element.coord == 'd6');
        d6.piece = Pawn(PieceColor.white);

        final result = board.getKnightMoves(e4);

        expect(result.isRight(), true);
        final cells = result.right as Iterable<Cell>;
        expect(cells.length, 0);
      });
    });

    group("Get Bishop Moves", () {
      test("All Free Directions", () {
        final e4 = board.cells.firstWhere((element) => element.coord == 'e4');
        e4.piece = Bishop(PieceColor.white);

        final result = board.getBishopMoves(e4);

        expect(result.isRight(), true);
        final cells = result.right as Iterable<Cell>;
        expect(cells.length, 13);
        expect(cells.map((e) => e.coord).contains("f5"), true);
        expect(cells.map((e) => e.coord).contains("g6"), true);
        expect(cells.map((e) => e.coord).contains("h7"), true);
        expect(cells.map((e) => e.coord).contains("f3"), true);
        expect(cells.map((e) => e.coord).contains("g2"), true);
        expect(cells.map((e) => e.coord).contains("h1"), true);
        expect(cells.map((e) => e.coord).contains("d5"), true);
        expect(cells.map((e) => e.coord).contains("c6"), true);
        expect(cells.map((e) => e.coord).contains("b7"), true);
        expect(cells.map((e) => e.coord).contains("a8"), true);
        expect(cells.map((e) => e.coord).contains("d3"), true);
        expect(cells.map((e) => e.coord).contains("c2"), true);
        expect(cells.map((e) => e.coord).contains("b1"), true);
      });

      test("Enemy Direction", () {
        final e4 = board.cells.firstWhere((element) => element.coord == 'e4');
        e4.piece = Bishop(PieceColor.white);

        final g6 = board.cells.firstWhere((element) => element.coord == 'g6');
        g6.piece = Bishop(PieceColor.black);

        final result = board.getBishopMoves(e4);

        expect(result.isRight(), true);
        final cells = result.right as Iterable<Cell>;
        expect(cells.length, 12);
        expect(cells.map((e) => e.coord).contains("f5"), true);
        expect(cells.map((e) => e.coord).contains("g6"), true);
        expect(cells.map((e) => e.coord).contains("f3"), true);
        expect(cells.map((e) => e.coord).contains("g2"), true);
        expect(cells.map((e) => e.coord).contains("h1"), true);
        expect(cells.map((e) => e.coord).contains("d5"), true);
        expect(cells.map((e) => e.coord).contains("c6"), true);
        expect(cells.map((e) => e.coord).contains("b7"), true);
        expect(cells.map((e) => e.coord).contains("a8"), true);
        expect(cells.map((e) => e.coord).contains("d3"), true);
        expect(cells.map((e) => e.coord).contains("c2"), true);
        expect(cells.map((e) => e.coord).contains("b1"), true);
      });

      test("Ally Direction", () {
        final e4 = board.cells.firstWhere((element) => element.coord == 'e4');
        e4.piece = Bishop(PieceColor.white);

        final g6 = board.cells.firstWhere((element) => element.coord == 'g6');
        g6.piece = Bishop(PieceColor.white);

        final result = board.getBishopMoves(e4);

        expect(result.isRight(), true);
        final cells = result.right as Iterable<Cell>;
        expect(cells.length, 11);
        expect(cells.map((e) => e.coord).contains("f5"), true);
        expect(cells.map((e) => e.coord).contains("f3"), true);
        expect(cells.map((e) => e.coord).contains("g2"), true);
        expect(cells.map((e) => e.coord).contains("h1"), true);
        expect(cells.map((e) => e.coord).contains("d5"), true);
        expect(cells.map((e) => e.coord).contains("c6"), true);
        expect(cells.map((e) => e.coord).contains("b7"), true);
        expect(cells.map((e) => e.coord).contains("a8"), true);
        expect(cells.map((e) => e.coord).contains("d3"), true);
        expect(cells.map((e) => e.coord).contains("c2"), true);
        expect(cells.map((e) => e.coord).contains("b1"), true);
      });
    });

    group("Get Rook Moves", () {
      test("All Free Directions", () {
        final e4 = board.cells.firstWhere((element) => element.coord == 'e4');
        e4.piece = Rook(PieceColor.white);

        final result = board.getRookMoves(e4);

        expect(result.isRight(), true);
        final cells = result.right as Iterable<Cell>;
        expect(cells.length, 14);
        expect(cells.map((e) => e.coord).contains("e5"), true);
        expect(cells.map((e) => e.coord).contains("e6"), true);
        expect(cells.map((e) => e.coord).contains("e7"), true);
        expect(cells.map((e) => e.coord).contains("e8"), true);
        expect(cells.map((e) => e.coord).contains("e3"), true);
        expect(cells.map((e) => e.coord).contains("e2"), true);
        expect(cells.map((e) => e.coord).contains("e1"), true);
        expect(cells.map((e) => e.coord).contains("f4"), true);
        expect(cells.map((e) => e.coord).contains("g4"), true);
        expect(cells.map((e) => e.coord).contains("h4"), true);
        expect(cells.map((e) => e.coord).contains("d4"), true);
        expect(cells.map((e) => e.coord).contains("c4"), true);
        expect(cells.map((e) => e.coord).contains("b4"), true);
        expect(cells.map((e) => e.coord).contains("a4"), true);
      });

      test("Enemy Direction", () {
        final e4 = board.cells.firstWhere((element) => element.coord == 'e4');
        e4.piece = Rook(PieceColor.white);

        final e5 = board.cells.firstWhere((element) => element.coord == 'e5');
        e5.piece = Rook(PieceColor.black);

        final result = board.getRookMoves(e4);

        expect(result.isRight(), true);
        final cells = result.right as Iterable<Cell>;
        expect(cells.length, 11);
        expect(cells.map((e) => e.coord).contains("e5"), true);
        expect(cells.map((e) => e.coord).contains("e3"), true);
        expect(cells.map((e) => e.coord).contains("e2"), true);
        expect(cells.map((e) => e.coord).contains("e1"), true);
        expect(cells.map((e) => e.coord).contains("f4"), true);
        expect(cells.map((e) => e.coord).contains("g4"), true);
        expect(cells.map((e) => e.coord).contains("h4"), true);
        expect(cells.map((e) => e.coord).contains("d4"), true);
        expect(cells.map((e) => e.coord).contains("c4"), true);
        expect(cells.map((e) => e.coord).contains("b4"), true);
        expect(cells.map((e) => e.coord).contains("a4"), true);
      });

      test("Ally Direction", () {
        final e4 = board.cells.firstWhere((element) => element.coord == 'e4');
        e4.piece = Rook(PieceColor.white);

        final e5 = board.cells.firstWhere((element) => element.coord == 'e5');
        e5.piece = Rook(PieceColor.white);

        final result = board.getRookMoves(e4);

        expect(result.isRight(), true);
        final cells = result.right as Iterable<Cell>;
        expect(cells.length, 10);
        expect(cells.map((e) => e.coord).contains("e3"), true);
        expect(cells.map((e) => e.coord).contains("e2"), true);
        expect(cells.map((e) => e.coord).contains("e1"), true);
        expect(cells.map((e) => e.coord).contains("f4"), true);
        expect(cells.map((e) => e.coord).contains("g4"), true);
        expect(cells.map((e) => e.coord).contains("h4"), true);
        expect(cells.map((e) => e.coord).contains("d4"), true);
        expect(cells.map((e) => e.coord).contains("c4"), true);
        expect(cells.map((e) => e.coord).contains("b4"), true);
        expect(cells.map((e) => e.coord).contains("a4"), true);
      });
    });

    group("Get Queen Moves", () {
      test("All Free Directions", () {
        final e4 = board.cells.firstWhere((element) => element.coord == 'e4');
        e4.piece = Queen(PieceColor.white);

        final result = board.getQueenMoves(e4);

        expect(result.isRight(), true);
        final cells = result.right as Iterable<Cell>;
        expect(cells.length, 27);
        expect(cells.map((e) => e.coord).contains("e5"), true);
        expect(cells.map((e) => e.coord).contains("e6"), true);
        expect(cells.map((e) => e.coord).contains("e7"), true);
        expect(cells.map((e) => e.coord).contains("e8"), true);
        expect(cells.map((e) => e.coord).contains("e3"), true);
        expect(cells.map((e) => e.coord).contains("e2"), true);
        expect(cells.map((e) => e.coord).contains("e1"), true);
        expect(cells.map((e) => e.coord).contains("f4"), true);
        expect(cells.map((e) => e.coord).contains("g4"), true);
        expect(cells.map((e) => e.coord).contains("h4"), true);
        expect(cells.map((e) => e.coord).contains("d4"), true);
        expect(cells.map((e) => e.coord).contains("c4"), true);
        expect(cells.map((e) => e.coord).contains("b4"), true);
        expect(cells.map((e) => e.coord).contains("a4"), true);
        expect(cells.map((e) => e.coord).contains("f5"), true);
        expect(cells.map((e) => e.coord).contains("f3"), true);
        expect(cells.map((e) => e.coord).contains("g2"), true);
        expect(cells.map((e) => e.coord).contains("h1"), true);
        expect(cells.map((e) => e.coord).contains("d5"), true);
        expect(cells.map((e) => e.coord).contains("c6"), true);
        expect(cells.map((e) => e.coord).contains("b7"), true);
        expect(cells.map((e) => e.coord).contains("a8"), true);
        expect(cells.map((e) => e.coord).contains("d3"), true);
        expect(cells.map((e) => e.coord).contains("c2"), true);
        expect(cells.map((e) => e.coord).contains("b1"), true);
        expect(cells.map((e) => e.coord).contains("f3"), true);
        expect(cells.map((e) => e.coord).contains("g2"), true);
        expect(cells.map((e) => e.coord).contains("h1"), true);
        expect(cells.map((e) => e.coord).contains("f5"), true);
        expect(cells.map((e) => e.coord).contains("g6"), true);
        expect(cells.map((e) => e.coord).contains("h7"), true);
      });

      test("Enemy Direction", () {
        final e4 = board.cells.firstWhere((element) => element.coord == 'e4');
        e4.piece = Queen(PieceColor.white);

        final e5 = board.cells.firstWhere((element) => element.coord == 'e5');
        e5.piece = Queen(PieceColor.black);

        final result = board.getQueenMoves(e4);

        expect(result.isRight(), true);
        final cells = result.right as Iterable<Cell>;
        expect(cells.length, 24);
        expect(cells.map((e) => e.coord).contains("e5"), true);
        expect(cells.map((e) => e.coord).contains("e3"), true);
        expect(cells.map((e) => e.coord).contains("e2"), true);
        expect(cells.map((e) => e.coord).contains("e1"), true);
        expect(cells.map((e) => e.coord).contains("f4"), true);
        expect(cells.map((e) => e.coord).contains("g4"), true);
        expect(cells.map((e) => e.coord).contains("h4"), true);
        expect(cells.map((e) => e.coord).contains("d4"), true);
        expect(cells.map((e) => e.coord).contains("c4"), true);
        expect(cells.map((e) => e.coord).contains("b4"), true);
        expect(cells.map((e) => e.coord).contains("a4"), true);
        expect(cells.map((e) => e.coord).contains("f5"), true);
        expect(cells.map((e) => e.coord).contains("f3"), true);
        expect(cells.map((e) => e.coord).contains("g2"), true);
        expect(cells.map((e) => e.coord).contains("h1"), true);
        expect(cells.map((e) => e.coord).contains("d5"), true);
        expect(cells.map((e) => e.coord).contains("c6"), true);
        expect(cells.map((e) => e.coord).contains("b7"), true);
        expect(cells.map((e) => e.coord).contains("a8"), true);
        expect(cells.map((e) => e.coord).contains("d3"), true);
        expect(cells.map((e) => e.coord).contains("c2"), true);
        expect(cells.map((e) => e.coord).contains("b1"), true);
        expect(cells.map((e) => e.coord).contains("f3"), true);
        expect(cells.map((e) => e.coord).contains("g2"), true);
        expect(cells.map((e) => e.coord).contains("h1"), true);
        expect(cells.map((e) => e.coord).contains("f5"), true);
        expect(cells.map((e) => e.coord).contains("g6"), true);
        expect(cells.map((e) => e.coord).contains("h7"), true);
      });

      test("Ally Direction", () {
        final e4 = board.cells.firstWhere((element) => element.coord == 'e4');
        e4.piece = Queen(PieceColor.white);

        final e5 = board.cells.firstWhere((element) => element.coord == 'e5');
        e5.piece = Queen(PieceColor.white);

        final result = board.getQueenMoves(e4);

        expect(result.isRight(), true);
        final cells = result.right as Iterable<Cell>;
        expect(cells.length, 23);
        expect(cells.map((e) => e.coord).contains("e3"), true);
        expect(cells.map((e) => e.coord).contains("e2"), true);
        expect(cells.map((e) => e.coord).contains("e1"), true);
        expect(cells.map((e) => e.coord).contains("f4"), true);
        expect(cells.map((e) => e.coord).contains("g4"), true);
        expect(cells.map((e) => e.coord).contains("h4"), true);
        expect(cells.map((e) => e.coord).contains("d4"), true);
        expect(cells.map((e) => e.coord).contains("c4"), true);
        expect(cells.map((e) => e.coord).contains("b4"), true);
        expect(cells.map((e) => e.coord).contains("a4"), true);
        expect(cells.map((e) => e.coord).contains("f5"), true);
        expect(cells.map((e) => e.coord).contains("f3"), true);
        expect(cells.map((e) => e.coord).contains("g2"), true);
        expect(cells.map((e) => e.coord).contains("h1"), true);
        expect(cells.map((e) => e.coord).contains("d5"), true);
        expect(cells.map((e) => e.coord).contains("c6"), true);
        expect(cells.map((e) => e.coord).contains("b7"), true);
        expect(cells.map((e) => e.coord).contains("a8"), true);
        expect(cells.map((e) => e.coord).contains("d3"), true);
        expect(cells.map((e) => e.coord).contains("c2"), true);
        expect(cells.map((e) => e.coord).contains("b1"), true);
        expect(cells.map((e) => e.coord).contains("f3"), true);
        expect(cells.map((e) => e.coord).contains("g2"), true);
        expect(cells.map((e) => e.coord).contains("h1"), true);
        expect(cells.map((e) => e.coord).contains("f5"), true);
        expect(cells.map((e) => e.coord).contains("g6"), true);
        expect(cells.map((e) => e.coord).contains("h7"), true);
      });
    });

    group("Get King Moves", () {
      test("Empty Board", () {
        final e4 = board.cells.firstWhere((element) => element.coord == 'e4');
        e4.piece = King(PieceColor.white);

        final result = board.getKingMoves(e4);

        expect(result.isRight(), true);
        final cells = result.right as Iterable<Cell>;
        expect(cells.length, 8);
        expect(cells.map((e) => e.coord).contains("e5"), true);
        expect(cells.map((e) => e.coord).contains("e3"), true);
        expect(cells.map((e) => e.coord).contains("f4"), true);
        expect(cells.map((e) => e.coord).contains("f5"), true);
        expect(cells.map((e) => e.coord).contains("f3"), true);
        expect(cells.map((e) => e.coord).contains("d4"), true);
        expect(cells.map((e) => e.coord).contains("d5"), true);
        expect(cells.map((e) => e.coord).contains("d3"), true);
      });

      test("Enemy Direction", () {
        final e4 = board.cells.firstWhere((element) => element.coord == 'e4');
        e4.piece = King(PieceColor.white);

        final e5 = board.cells.firstWhere((element) => element.coord == 'e5');
        e5.piece = Queen(PieceColor.black);

        final result = board.getKingMoves(e4);

        expect(result.isRight(), true);
        final cells = result.right as Iterable<Cell>;
        expect(cells.length, 8);
        expect(cells.map((e) => e.coord).contains("e5"), true);
        expect(cells.map((e) => e.coord).contains("e3"), true);
        expect(cells.map((e) => e.coord).contains("f4"), true);
        expect(cells.map((e) => e.coord).contains("f5"), true);
        expect(cells.map((e) => e.coord).contains("f3"), true);
        expect(cells.map((e) => e.coord).contains("d4"), true);
        expect(cells.map((e) => e.coord).contains("d5"), true);
        expect(cells.map((e) => e.coord).contains("d3"), true);
      });

      test("Ally Direction", () {
        final e4 = board.cells.firstWhere((element) => element.coord == 'e4');
        e4.piece = King(PieceColor.white);

        final e5 = board.cells.firstWhere((element) => element.coord == 'e5');
        e5.piece = Queen(PieceColor.white);

        final result = board.getKingMoves(e4);

        expect(result.isRight(), true);
        final cells = result.right as Iterable<Cell>;
        expect(cells.length, 7);
        expect(cells.map((e) => e.coord).contains("e3"), true);
        expect(cells.map((e) => e.coord).contains("f4"), true);
        expect(cells.map((e) => e.coord).contains("f5"), true);
        expect(cells.map((e) => e.coord).contains("f3"), true);
        expect(cells.map((e) => e.coord).contains("d4"), true);
        expect(cells.map((e) => e.coord).contains("d5"), true);
        expect(cells.map((e) => e.coord).contains("d3"), true);
      });

      test("Right Castling", () {
        final e1 = board.cells.firstWhere((element) => element.coord == 'e1');
        e1.piece = King(PieceColor.white);

        final h1 = board.cells.firstWhere((element) => element.coord == 'h1');
        h1.piece = Rook(PieceColor.white);

        final result = board.getKingMoves(e1);

        expect(result.isRight(), true);
        final cells = result.right as Iterable<Cell>;
        expect(cells.length, 6);
        expect(cells.map((e) => e.coord).contains("e2"), true);
        expect(cells.map((e) => e.coord).contains("f2"), true);
        expect(cells.map((e) => e.coord).contains("f1"), true);
        expect(cells.map((e) => e.coord).contains("d1"), true);
        expect(cells.map((e) => e.coord).contains("d2"), true);
        expect(cells.map((e) => e.coord).contains("g1"), true);
      });

      test("Left Castling", () {
        final e1 = board.cells.firstWhere((element) => element.coord == 'e1');
        e1.piece = King(PieceColor.white);

        final a1 = board.cells.firstWhere((element) => element.coord == 'a1');
        a1.piece = Rook(PieceColor.white);

        final result = board.getKingMoves(e1);

        expect(result.isRight(), true);
        final cells = result.right as Iterable<Cell>;
        expect(cells.length, 6);
        expect(cells.map((e) => e.coord).contains("e2"), true);
        expect(cells.map((e) => e.coord).contains("f2"), true);
        expect(cells.map((e) => e.coord).contains("f1"), true);
        expect(cells.map((e) => e.coord).contains("d1"), true);
        expect(cells.map((e) => e.coord).contains("d2"), true);
        expect(cells.map((e) => e.coord).contains("c1"), true);
      });

      test("Right Castling Blocked By Ally", () {
        final e1 = board.cells.firstWhere((element) => element.coord == 'e1');
        e1.piece = King(PieceColor.white);

        final h1 = board.cells.firstWhere((element) => element.coord == 'h1');
        h1.piece = Rook(PieceColor.white);

        final f1 = board.cells.firstWhere((element) => element.coord == 'f1');
        f1.piece = Queen(PieceColor.white);

        final result = board.getKingMoves(e1);

        expect(result.isRight(), true);
        final cells = result.right as Iterable<Cell>;
        expect(cells.length, 4);
        expect(cells.map((e) => e.coord).contains("e2"), true);
        expect(cells.map((e) => e.coord).contains("f2"), true);
        expect(cells.map((e) => e.coord).contains("d1"), true);
        expect(cells.map((e) => e.coord).contains("d2"), true);
      });

      test("Left Castling Blocked By Ally", () {
        final e1 = board.cells.firstWhere((element) => element.coord == 'e1');
        e1.piece = King(PieceColor.white);

        final a1 = board.cells.firstWhere((element) => element.coord == 'a1');
        a1.piece = Rook(PieceColor.white);

        final d1 = board.cells.firstWhere((element) => element.coord == 'd1');
        d1.piece = Queen(PieceColor.white);

        final result = board.getKingMoves(e1);

        expect(result.isRight(), true);
        final cells = result.right as Iterable<Cell>;
        expect(cells.length, 4);
        expect(cells.map((e) => e.coord).contains("e2"), true);
        expect(cells.map((e) => e.coord).contains("f2"), true);
        expect(cells.map((e) => e.coord).contains("f1"), true);
        expect(cells.map((e) => e.coord).contains("d2"), true);
      });

      test("Right Castling Blocked By Enemy", () {
        final e1 = board.cells.firstWhere((element) => element.coord == 'e1');
        e1.piece = King(PieceColor.white);

        final h1 = board.cells.firstWhere((element) => element.coord == 'h1');
        h1.piece = Rook(PieceColor.white);

        final g1 = board.cells.firstWhere((element) => element.coord == 'g1');
        g1.blackControl = 1;

        final result = board.getKingMoves(e1);

        expect(result.isRight(), true);
        final cells = result.right as Iterable<Cell>;
        expect(cells.length, 5);
        expect(cells.map((e) => e.coord).contains("e2"), true);
        expect(cells.map((e) => e.coord).contains("f2"), true);
        expect(cells.map((e) => e.coord).contains("d1"), true);
        expect(cells.map((e) => e.coord).contains("d2"), true);
        expect(cells.map((e) => e.coord).contains("f1"), true);
      });

      test("Left Castling Blocked By Enemy", () {
        final e1 = board.cells.firstWhere((element) => element.coord == 'e1');
        e1.piece = King(PieceColor.white);

        final a1 = board.cells.firstWhere((element) => element.coord == 'a1');
        a1.piece = Rook(PieceColor.white);

        final c1 = board.cells.firstWhere((element) => element.coord == 'c1');
        c1.blackControl = 1;

        final result = board.getKingMoves(e1);

        expect(result.isRight(), true);
        final cells = result.right as Iterable<Cell>;
        expect(cells.length, 5);
        expect(cells.map((e) => e.coord).contains("e2"), true);
        expect(cells.map((e) => e.coord).contains("f2"), true);
        expect(cells.map((e) => e.coord).contains("d1"), true);
        expect(cells.map((e) => e.coord).contains("d2"), true);
        expect(cells.map((e) => e.coord).contains("f1"), true);
      });

      test("Right Castling Blocked By Check", () {
        final e1 = board.cells.firstWhere((element) => element.coord == 'e1');
        e1.piece = King(PieceColor.white);

        final h1 = board.cells.firstWhere((element) => element.coord == 'h1');
        h1.piece = Rook(PieceColor.white);

        final f3 = board.cells.firstWhere((element) => element.coord == 'f3');
        f3.piece = Knight(PieceColor.black);
        e1.blackControl = 1;

        final result = board.getKingMoves(e1);

        expect(result.isRight(), true);
        final cells = result.right as Iterable<Cell>;
        expect(cells.length, 5);
        expect(cells.map((e) => e.coord).contains("e2"), true);
        expect(cells.map((e) => e.coord).contains("f2"), true);
        expect(cells.map((e) => e.coord).contains("d1"), true);
        expect(cells.map((e) => e.coord).contains("d2"), true);
        expect(cells.map((e) => e.coord).contains("f1"), true);
      });

      test("King Moves to Safety Cells", () {
        final e1 = board.cells.firstWhere((element) => element.coord == 'e1');
        e1.piece = King(PieceColor.white);

        final e5 = board.cells.firstWhere((element) => element.coord == 'e5');
        e5.piece = Queen(PieceColor.black);

        final e2 = board.cells.firstWhere((element) => element.coord == 'e2');

        e1.blackControl = 1;
        e2.blackControl = 1;

        final result = board.getKingMoves(e1);

        expect(result.isRight(), true);
        final cells = result.right as Iterable<Cell>;
        expect(cells.length, 4);
        expect(cells.map((e) => e.coord).contains("f2"), true);
        expect(cells.map((e) => e.coord).contains("d1"), true);
        expect(cells.map((e) => e.coord).contains("d2"), true);
        expect(cells.map((e) => e.coord).contains("f1"), true);
      });
    });
  });

  group("Movement Filtering", () {
    test("No random move while under Check", () async {
      PuzzleBoardAPI().fromFen(Fen.fromRaw("4Q2k/7p/8/8/8/8/8/K52 b - - 0 1"));

      final pawn = board.cells.firstWhere((element) => element.coord == 'h7');
      final result = await PuzzleBoardAPI().planPath(pawn);
      expect(result.isLeft(), true);
      expect(result.left, isA<CannotMoveWhileInCheckFailure>());
    });
    test("Rook Pinned", () async {
      PuzzleBoardAPI()
          .fromFen(Fen.fromRaw("4Q1rk/7p/8/8/8/8/8/K5R1 b - - 0 1"));

      final king = board.cells.firstWhere((element) => element.coord == 'h8');

      final result = await PuzzleBoardAPI().planPath(king);
      expect(result.isLeft(), true);
      expect(result.left, isA<CannotMoveWhileInCheckFailure>());

      final rook = board.cells.firstWhere((element) => element.coord == 'g8');
      final res = await PuzzleBoardAPI().planPath(rook);
      expect(res.isRight(), true);
      final cells = res.right;
      expect(cells.length, 2);
      expect(cells.map((e) => e.coord).contains("f8"), true);
      expect(cells.map((e) => e.coord).contains("e8"), true);
    });

    test("Defend check with Rook", () async {
      PuzzleBoardAPI().fromFen(Fen.fromRaw("4Q2k/7p/6r1/8/8/8/8/K7 b - - 0 1"));

      final king = board.cells.firstWhere((element) => element.coord == 'h8');

      final result = await PuzzleBoardAPI().planPath(king);
      expect(result.isRight(), true);
      expect(1, result.right.length);
      expect(result.right.first.coord, 'g7');

      final rook = board.cells.firstWhere((element) => element.coord == 'g6');
      final res = await PuzzleBoardAPI().planPath(rook);
      expect(res.isRight(), true);
      final cells = res.right;
      expect(cells.length, 1);
      expect(cells.map((e) => e.coord).contains("g8"), true);
    });
  });
}
