import 'dart:developer';

import 'package:clean_chess/chess/abstractions/piece.dart';
import 'package:clean_chess/chess/apis/puzzle_board_api.dart';
import 'package:clean_chess/chess/models/board.dart';
import 'package:clean_chess/chess/models/cell.dart';
import 'package:clean_chess/chess/models/fen.dart';
import 'package:clean_chess/chess/models/move.dart';
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
  final Color splashColor = Colors.indigo.shade800;
  final Color plannedCellsColor = Colors.indigo.shade700;
  final blackCell = const Color.fromARGB(255, 181, 136, 99);
  final whiteCell = const Color.fromARGB(255, 240, 217, 181);

  // Settings
  bool _showPowerHud = false;

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
        child: Stack(
          children: [
            _powerHud(),
            Center(child: _grid()),
            _bottomBar(),
          ],
        ),
      ),
    );
  }

  Widget _bottomBar() => Positioned(
        bottom: 0,
        left: 0,
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.grey.shade900,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  final previousMove = PuzzleBoardAPI().previousMove();
                  if (previousMove.isLeft()) {
                    log('Error: ${previousMove.left}');
                    return;
                  }
                  Board requestedMove = previousMove.right as Board;
                  board = requestedMove;
                  plannedCells.first = null;
                  plannedCells.second = [];
                  setState(() {});
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  final nextmove = PuzzleBoardAPI().nextMove();
                  if (nextmove.isLeft()) {
                    log('Error: ${nextmove.left}');
                    return;
                  }
                  Board requestedMove = nextmove.right as Board;
                  board = requestedMove;
                  plannedCells.first = null;
                  plannedCells.second = [];
                  setState(() {});
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      );

  Widget _powerHud() => Positioned(
        top: 0,
        left: 0,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Power: HUD", style: TextStyle(fontSize: 20)),
              Switch(
                value: _showPowerHud,
                onChanged: (value) => setState(() {
                  _showPowerHud = value;
                }),
              ),
            ],
          ),
        ),
      );

  Widget _grid() => ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: 600,
          height: 600,
          child: GridView.count(
            crossAxisCount: 8,
            children: board.cells.map((e) => _cell(e)).toList(),
          ),
        ),
      );

  Widget _cell(Cell cell) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: plannedCells.second.contains(cell)
            ? plannedCellsColor
            : getCellColor(cell.id),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if (plannedCells.first != null) {
              _cellSelection(cell);
            } else {
              _pieceSelection(cell);
            }
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
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: Text(cell.id.toString()),
                // ),
                if (_showPowerHud)
                  Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      children: [
                        Text(
                          cell.whitePower.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          cell.blackPower.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
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

  void _cellSelection(Cell cell) {
    // If selected piece is the same as the one selected, deselect it
    if (cell.piece == plannedCells.first) {
      plannedCells.second.clear();
      plannedCells.first = null;
      setState(() {});
      return;
    }

    final pieceCell = board.cells
        .firstWhere((element) => element.piece == plannedCells.first);

    final moveRequest = Move(pieceCell, cell);
    final moveResult = PuzzleBoardAPI().move(moveRequest);
    if (moveResult.isLeft()) {
      log('Error: ${moveResult.left}');
      return;
    }

    board = moveResult.right as Board;
    plannedCells.first = null;
    plannedCells.second.clear();
    setState(() {});
  }

  void _pieceSelection(Cell cell) {
    if (cell.piece == null) return;
    final paths = PuzzleBoardAPI().planPath(cell);
    if (paths.isLeft()) {
      log('Error: ${paths.left}');
      return;
    }

    final cells = paths.right as Iterable<Cell>;
    plannedCells.second.clear();
    plannedCells.second.addAll(cells);
    plannedCells.first = cell.piece;
    setState(() {});
  }
}
