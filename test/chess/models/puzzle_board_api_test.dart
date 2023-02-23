import 'package:clean_chess/chess/apis/puzzle_board_api.dart';
import 'package:clean_chess/chess/models/board.dart';
import 'package:clean_chess/chess/models/cell.dart';
import 'package:clean_chess/chess/models/fen.dart';
import 'package:clean_chess/chess/models/pieces.dart';
import 'package:clean_chess/chess/utilities/extensions.dart';
import 'package:clean_chess/core/utilities/enums.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // 0 0 0 0 k 0 0 0
  // 0 0 0 0 0 0 0 0
  // 0 0 0 0 0 0 0 0
  // 0 0 0 0 0 0 0 0
  // 0 0 0 0 R 0 0 0
  // 0 0 0 0 0 0 0 0
  // 0 0 0 0 0 0 0 0
  // 0 0 0 0 K 0 0 0

  setUp(
    () {
      PuzzleBoardAPI().fromFen(
        Fen.fromRaw("4k3/8/8/8/4R3/8/8/4K3 w - - 0 1"),
      );
    },
  );

  test("Move Rook", () {
    final e4 = PuzzleBoardAPI().board.cells.firstWhere((e) => e.coord == "e4");

    final paths = PuzzleBoardAPI().planPath(e4);

    expect(paths.isRight(), true);

    final cells = paths.right as Iterable<Cell>;
    expect(cells.length, 13);
    expect(cells.map((e) => e.coord).contains("e5"), true);
    expect(cells.map((e) => e.coord).contains("e6"), true);
    expect(cells.map((e) => e.coord).contains("e7"), true);
    expect(cells.map((e) => e.coord).contains("e8"), true);
    expect(cells.map((e) => e.coord).contains("e3"), true);
    expect(cells.map((e) => e.coord).contains("e2"), true);
    expect(cells.map((e) => e.coord).contains("f4"), true);
    expect(cells.map((e) => e.coord).contains("g4"), true);
    expect(cells.map((e) => e.coord).contains("h4"), true);
    expect(cells.map((e) => e.coord).contains("d4"), true);
    expect(cells.map((e) => e.coord).contains("c4"), true);
    expect(cells.map((e) => e.coord).contains("b4"), true);
    expect(cells.map((e) => e.coord).contains("a4"), true);
  });
}
