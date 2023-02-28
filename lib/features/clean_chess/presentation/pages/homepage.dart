import 'dart:developer';

import 'package:clean_chess/chess/abstractions/piece.dart';
import 'package:clean_chess/chess/apis/puzzle_board_api.dart';
import 'package:clean_chess/chess/core/utilities/assets.dart';
import 'package:clean_chess/chess/core/utilities/enums.dart';
import 'package:clean_chess/chess/error/failures.dart';
import 'package:clean_chess/chess/models/board.dart';
import 'package:clean_chess/chess/models/cell.dart';
import 'package:clean_chess/chess/models/move.dart';
import 'package:clean_chess/chess/models/puzzle.dart';
import 'package:clean_chess/chess/models/tuple.dart';
import 'package:clean_chess/chess/utilities/extensions.dart';
import 'package:clean_chess/core/clean_chess/utilities/style.dart';
import 'package:clean_chess/main.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Board board;
  late Puzzle puzzle;
  late PieceColor turn;

  Tuple<Piece?, List<Cell>> plannedCells = Tuple(null, []);

  // Customizable colors
  final Color splashColor = Colors.indigo.shade800;
  final Color plannedCellsColor = Colors.indigo.shade700;

  // Settings
  bool _showPowerHud = false;
  bool _showThreatsHud = true;

  // Statistics
  Iterable<Tuple<Piece, int>> _whiteKingThreats = [];
  Iterable<Tuple<Piece, int>> _blackKingThreats = [];

  // Utils
  bool isLandscape = false;

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
    turn = puzzle.fen.turn;
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
        appBar: AppBar(
          title: Text(puzzle.name),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: OrientationBuilder(
              builder: (context, orientation) {
                isLandscape = orientation == Orientation.landscape;
                if (isLandscape) {
                  return _landscapeLayout();
                } else {
                  return _portraitLayout();
                }
              },
            ),
          ),
        ),
        bottomNavigationBar: _bottomBar(),
      ),
    );
  }

  Widget _portraitLayout() => Column(
        children: [
          // Align(
          //   alignment: Alignment.topCenter,
          //   child: Text(
          //     puzzle.name,
          //     style: const TextStyle(
          //       color: Colors.white,
          //       fontSize: 20,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 50),
          Expanded(
            child: Column(
              children: [
                _portaitGrid(),
                Expanded(child: _portaitHudSection()),
              ],
            ),
          ),
        ],
      );

  Widget _landscapeLayout() => Column(
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
            child: isLandscape
                ? Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: _landscapeHudSection(),
                        ),
                      ),
                      _landScapeGrid(),
                    ],
                  )
                : Column(
                    children: [
                      _landScapeGrid(),
                      Expanded(child: _landscapeHudSection()),
                    ],
                  ),
          ),
        ],
      );

  Widget _portaitHudSection() => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Column(
              children: [
                _powerHud(),
                _threatsHud(),
              ],
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

  Widget _landscapeHudSection() => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Column(
              children: [
                _powerHud(),
                _threatsHud(),
              ],
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
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
                    flatWhiteKing,
                    scale: 7,
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
                    flatBlackKing,
                    scale: 7,
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

                _invertTurn();
                setState(() {
                  _whiteKingThreats = board.whiteKingThreats.map(
                    (e) => Tuple(e.first.piece!, e.second),
                  );
                  _blackKingThreats = board.blackKingThreats.map(
                    (e) => Tuple(e.first.piece!, e.second),
                  );
                });

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

                _invertTurn();
                setState(() {
                  _whiteKingThreats = board.whiteKingThreats.map(
                    (e) => Tuple(e.first.piece!, e.second),
                  );
                  _blackKingThreats = board.blackKingThreats.map(
                    (e) => Tuple(e.first.piece!, e.second),
                  );
                });

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
                      scale: 9,
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

  Widget _portaitGrid() => Column(
        children: [
          Row(
            children: [
              const Text(
                "Current Turn: ",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: turn == PieceColor.white ? Colors.white : Colors.black,
                  border: Border.all(
                    color: Colors.indigo.shade300,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.bottomCenter,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: double.maxFinite,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 8,
                    children: board.cells.map((e) => _cell(e)).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      );

  Widget _landScapeGrid() => Column(
        children: [
          Row(
            children: [
              const Text(
                "Current Turn: ",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: turn == PieceColor.white ? Colors.white : Colors.black,
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.bottomCenter,
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: MediaQuery.of(context).size.height * 0.7,
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 8,
                    children: board.cells.map((e) => _cell(e)).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      );

  Widget _cell(Cell cell) {
    Color cellColor = plannedCells.second.contains(cell)
        ? plannedCellsColor
        : getCellColor(cell.id);
    if (plannedCells.first != null) {
      final pieceCell = board.cells
          .firstWhere((element) => element.piece == plannedCells.first);
      if (pieceCell == cell) {
        cellColor = Colors.indigo.shade400;
      }
    }
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: cellColor,
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
                  child: Text(
                    cell.coord,
                    style: TextStyle(
                      fontSize: isLandscape ? 12 : 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
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

  void _cellSelection(Cell cell) {
    // If selected piece is the same as the one selected, deselect it
    if (cell.piece == plannedCells.first) {
      plannedCells.second.clear();
      plannedCells.first = null;
      setState(() {});
      return;
    }

    if (cell.piece != null && cell.piece!.color == turn) {
      plannedCells.second.clear();
      plannedCells.first = cell.piece;
      _pieceSelection(cell);
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
    _invertTurn();

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
        duration: const Duration(milliseconds: 500),
      ),
    );
  }

  void _invertTurn() {
    if (turn == PieceColor.white) {
      turn = PieceColor.black;
    } else {
      turn = PieceColor.white;
    }
  }
}
