import 'dart:developer';

import 'package:clean_chess/chess/abstractions/piece.dart';
import 'package:clean_chess/chess/apis/puzzle_board_api.dart';
import 'package:clean_chess/chess/models/board.dart';
import 'package:clean_chess/chess/models/cell.dart';
import 'package:clean_chess/chess/models/fen.dart';
import 'package:clean_chess/chess/models/tuple.dart';
import 'package:clean_chess/chess/utilities/extensions.dart';
import 'package:flutter/material.dart';

class NewHomepage extends StatefulWidget {
  const NewHomepage({super.key});

  @override
  State<NewHomepage> createState() => _NewHomepageState();
}

class _NewHomepageState extends State<NewHomepage> {
  late Board board;

  Tuple<Piece?, List<Cell>> plannedCells = Tuple(null, []);

  // Customizable colors
  final Color splashColor = Colors.grey.shade800;
  final Color plannedCellsColor = Colors.indigo.shade700;
  final blackCell = const Color.fromARGB(255, 181, 136, 99);
  final whiteCell = const Color.fromARGB(255, 240, 217, 181);

  @override
  void initState() {
    final boardRequest = PuzzleBoardAPI().fromFen(
      Fen.fromRaw('r6k/pp2r2p/4Rp1Q/3p4/8/1N1P2R1/PqP2bPP/7K b - - 0 24,'),
    );
    if (boardRequest.isLeft()) {
      log('Error: ${boardRequest.left}');
      board = Board.empty();
    } else {
      board = boardRequest.right;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _grid(),
          ],
        ),
      ),
    );
  }

  Widget _grid() => SizedBox(
        width: 600,
        height: 600,
        child: GridView.count(
          crossAxisCount: 8,
          children: board.cells.map((e) => _cell(e)).toList(),
        ),
      );

  Widget _cell(Cell cell) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: plannedCells.second.contains(cell)
            ? plannedCellsColor
            : getCellColor(cell.id),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if (cell.piece == null) return;

            if (cell.piece == plannedCells.first) {
              plannedCells.second.clear();
              plannedCells.first = null;
              setState(() {});
              return;
            }

            final paths = PuzzleBoardAPI().planPath(cell.piece!);
            if (paths.isLeft()) {
              log('Error: ${paths.left}');
              return;
            }

            final cells = paths.right as Iterable<Cell>;
            plannedCells.second.clear();
            plannedCells.second.addAll(cells);
            plannedCells.first = cell.piece;
            setState(() {});
          },
          splashColor: splashColor,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(cell.coord),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(cell.id.toString()),
                ),
                Align(
                  alignment: Alignment.center,
                  child: cell.piece != null
                      ? Image.asset(
                          cell.piece!.imagePath,
                          width: 50,
                          height: 50,
                        )
                      : Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color getCellColor(int index) {
    int cellColor = (index % 2);
    int row = (index ~/ 8) % 2;
    if (row == 0) {
      cellColor = (index % 2) == 0 ? 1 : 0;
    }
    return cellColor == 0 ? whiteCell : blackCell;
  }
}