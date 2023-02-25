import 'dart:developer';

import 'package:clean_chess/chess/abstractions/piece.dart';
import 'package:clean_chess/chess/apis/puzzle_board_api.dart';
import 'package:clean_chess/chess/core/utilities/assets.dart';
import 'package:clean_chess/chess/core/utilities/enums.dart';
import 'package:clean_chess/chess/core/utilities/extensions.dart';
import 'package:clean_chess/chess/error/failures.dart';
import 'package:clean_chess/chess/models/board.dart';
import 'package:clean_chess/chess/models/cell.dart';
import 'package:clean_chess/chess/models/move.dart';
import 'package:clean_chess/chess/models/puzzle.dart';
import 'package:clean_chess/chess/models/tuple.dart';
import 'package:clean_chess/chess/utilities/extensions.dart';
import 'package:clean_chess/main.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final bool mobileBulild = true;

  late Board board;
  late Puzzle puzzle;

  Tuple<Piece?, List<Cell>> plannedCells = Tuple(null, []);

  // Customizable colors
  final Color splashColor = Colors.indigo.shade800;
  final Color plannedCellsColor = Colors.indigo.shade700;
  final blackCell = const Color.fromARGB(255, 181, 136, 99);
  final whiteCell = const Color.fromARGB(255, 240, 217, 181);

  // Settings
  bool _showPowerHud = false;
  bool _showThreatsHud = true;

  // Statistics
  Iterable<Tuple<Piece, int>> _whiteKingThreats = [];
  Iterable<Tuple<Piece, int>> _blackKingThreats = [];

  @override
  void initState() {
    _setupNewPuzzle(debugPuzzle: true);
    super.initState();
  }

  void _setupNewPuzzle({bool debugPuzzle = false}) {
    puzzle =
        debugPuzzle ? Puzzle.fromLichessDB(puzzleDb.first) : getRandomPuzzle();
    final boardRequest = PuzzleBoardAPI().fromFen(puzzle.fen);
    if (boardRequest.isLeft()) {
      _snackbarError(boardRequest.left);
      board = Board.empty();
    } else {
      board = boardRequest.right;
    }
    _refreshThreats();
  }

  void _refreshThreats() {
    setState(() {
      _whiteKingThreats = PuzzleBoardAPI().getKingThreats(PieceColor.white);
      _blackKingThreats = PuzzleBoardAPI().getKingThreats(PieceColor.black);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    puzzle.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Expanded(
                  child: Column(
                    children: [
                      _grid(),
                      Expanded(child: _hudSection()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _bottomBar(),
      ),
    );
  }

  Widget _hudSection() => Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  _powerHud(),
                  _threatsHud(),
                ],
              ),
            ),
            Expanded(
              child: Visibility(
                visible: _showThreatsHud,
                child: _threatsTable(),
              ),
            ),
          ],
        ),
      );

  Widget _threatsTable() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    whiteKing,
                    scale: 3,
                  ),
                  _enemyThreats(_whiteKingThreats),
                ],
              ),
            ),
            Container(
              width: 1,
              height: MediaQuery.of(context).size.height * 0.5,
              color: Colors.white,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    blackKing,
                    scale: 3,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  _enemyThreats(_blackKingThreats),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _bottomBar() => Container(
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
                  _snackbarError(previousMove.left);
                  return;
                }
                Board requestedMove = previousMove.right as Board;
                board = requestedMove;
                plannedCells.first = null;
                plannedCells.second = [];

                _refreshThreats();

                setState(() {});
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () => _setupNewPuzzle(),
              icon: const Icon(
                Icons.refresh_rounded,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                final nextmove = PuzzleBoardAPI().nextMove();
                if (nextmove.isLeft()) {
                  _snackbarError(nextmove.left);
                  return;
                }
                Board requestedMove = nextmove.right as Board;
                board = requestedMove;
                plannedCells.first = null;
                plannedCells.second = [];

                _refreshThreats();

                setState(() {});
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            )
          ],
        ),
      );

  Widget _powerHud() => Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("Power: HUD", style: TextStyle(fontSize: 16)),
            const SizedBox(width: 15),
            Switch(
              value: _showPowerHud,
              onChanged: (value) => setState(() {
                _showPowerHud = value;
              }),
            ),
          ],
        ),
      );

  Widget _threatsHud() => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Threats: HUD", style: TextStyle(fontSize: 16)),
                const SizedBox(width: 10),
                Switch(
                  value: _showThreatsHud,
                  onChanged: (value) => setState(() {
                    _showThreatsHud = value;
                  }),
                ),
              ],
            ),
          ],
        ),
      );

  Widget _enemyThreats(Iterable<Tuple<Piece, int>> threats) => Column(
        children: threats
            .map(
              (threat) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      threat.first.imagePath,
                      scale: 3.5,
                    ),
                    Text(
                      threat.second.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: threat.second == 1
                            ? Colors.red
                            : threat.second == 2
                                ? Colors.orange
                                : Colors.amber,
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      );

  Widget _grid() => ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: double.maxFinite,
          child: AspectRatio(
            aspectRatio: 1,
            child: GridView.count(
              crossAxisCount: 8,
              children: board.cells.map((e) => _cell(e)).toList(),
            ),
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
      _snackbarError(moveResult.left);
      return;
    }

    board = moveResult.right as Board;
    plannedCells.first = null;
    plannedCells.second.clear();

    _refreshThreats();

    setState(() {});
  }

  void _pieceSelection(Cell cell) {
    if (cell.piece == null) return;
    final paths = PuzzleBoardAPI().planPath(cell);
    if (paths.isLeft()) {
      _snackbarError(paths.left);
      return;
    }

    final cells = paths.right as Iterable<Cell>;
    plannedCells.second.clear();
    plannedCells.second.addAll(cells);
    plannedCells.first = cell.piece;
    setState(() {});
  }

  void _snackbarError(Failure failure) {
    log(failure.message);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          failure.message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
