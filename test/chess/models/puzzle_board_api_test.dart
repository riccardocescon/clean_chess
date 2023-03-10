import 'package:cleanchess/chess/apis/puzzle_board_api.dart';
import 'package:cleanchess/chess/models/board.dart';
import 'package:cleanchess/chess/models/cell.dart';
import 'package:cleanchess/chess/models/fen.dart';
import 'package:cleanchess/chess/models/pieces.dart';
import 'package:cleanchess/chess/utilities/extensions.dart';
import 'package:cleanchess/chess/core/utilities/enums.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // 0 0 0 k q 0 0 0
  // 0 0 0 0 0 0 0 0
  // 0 0 0 0 0 0 0 0
  // 0 0 0 0 0 0 0 0
  // 0 0 0 0 R 0 0 0
  // 0 0 0 0 0 0 0 0
  // 0 0 0 0 0 0 0 0
  // 0 0 0 K Q 0 0 0

  setUp(
    () {
      PuzzleBoardAPI().fromFen(
        Fen.fromRaw("3kq3/8/8/8/4R3/8/8/3KQ3 w - - 0 1"),
      );
    },
  );

  test("Move Rook", () async {
    final e4 = PuzzleBoardAPI().board.cells.firstWhere((e) => e.coord == "e4");

    final paths = await PuzzleBoardAPI().planPath(e4);

    expect(paths.isRight(), true);

    final cells = paths.right;
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
