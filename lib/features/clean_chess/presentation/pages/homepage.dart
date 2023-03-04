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
import 'package:clean_chess/core/clean_chess/presentation/dialogs/pawn_promotion_dialog.dart';
import 'package:clean_chess/core/clean_chess/presentation/widgets/arrow.dart';
import 'package:clean_chess/core/clean_chess/presentation/widgets/bottom_bar.dart';
import 'package:clean_chess/core/clean_chess/presentation/widgets/cell.dart';
import 'package:clean_chess/core/clean_chess/presentation/widgets/hud/hud_switcher.dart';
import 'package:clean_chess/core/clean_chess/presentation/widgets/threats/threats_table.dart';
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
  bool _showThreatsHud = false;
  bool _planMode = false;

  // Statistics
  Iterable<Tuple<Piece, int>> _whiteKingThreats = [];
  Iterable<Tuple<Piece, int>> _blackKingThreats = [];

  // Utils
  bool isLandscape = false;
  final List<Tuple<GlobalObjectKey, Cell>> _cellKeys = [];

  // Plan Mode
  GlobalObjectKey? _selectedCellKey;
  final List<Tuple<GlobalObjectKey, GlobalKey>> _arrows = [];

  @override
  void initState() {
    _setupNewPuzzle(debugPuzzle: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
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
                    return isLandscape ? _landscapeLayout() : _portraitLayout();
                  },
                ),
              ),
            ),
            bottomNavigationBar:
                _planMode ? _bottomBarPlanMode() : _bottomBar(),
          ),
        ),
        ..._arrowsLayer(),
      ],
    );
  }

  Widget _bottomBar() => BottomBar(
        buttons: [
          BottomButton(
            iconButton: Icons.arrow_back_ios_new,
            onPressed: _onPreviousMove,
          ),
          BottomButton(
            iconButton: Icons.refresh_rounded,
            onPressed: _setupNewPuzzle,
          ),
          BottomButton(
            iconButton: Icons.edit_rounded,
            onPressed: () => setState(() {
              _planMode = true;
            }),
          ),
          BottomButton(
            iconButton: Icons.arrow_forward_ios,
            onPressed: _onNextMove,
          ),
        ],
      );

  Widget _cell(Cell cell) {
    final key = _getCellKey(cell);

    return BoardCell(
      cell: cell,
      cellKey: key,
      color: _getCurrentCellColor(cell),
      splashColor: splashColor,
      isLandscape: isLandscape,
      showPowerHud: _showPowerHud,
      onTap: () => _onCellTappedDetector(cell, key),
    );
  }

  //#region Layouts

  Widget _portraitLayout() => Column(
        children: [
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

  Widget _turnIndicator() => Row(
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
      );

  Widget _portaitGrid() => Column(
        children: [
          _turnIndicator(),
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
          _turnIndicator(),
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

  //#endregion

  //#region HUDs

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

  Widget _powerHud() => HudSwitcher(
        title: "Power HUD",
        value: _showPowerHud,
        onChange: (value) => setState(() {
          _showPowerHud = value;
        }),
      );

  Widget _threatsHud() => HudSwitcher(
        title: "Threats HUD",
        value: _showThreatsHud,
        onChange: (value) => setState(() {
          _showThreatsHud = value;
        }),
      );

  Widget _threatsTable() => ThreatsTable(
        whiteThreats: _whiteKingThreats,
        blackThreats: _blackKingThreats,
      );

  //#endregion

  //#region Plan Mode
  Widget _bottomBarPlanMode() => BottomBar(
        buttons: [
          BottomButton(
            iconButton: Icons.task_alt_rounded,
            onPressed: () => setState(() {
              _planMode = false;
              _arrows.clear();
            }),
          ),
          BottomButton(
            iconButton: Icons.delete_rounded,
            onPressed: () => setState(() {
              _arrows.clear();
            }),
          ),
        ],
      );

  List<Widget> _arrowsLayer() {
    return _cellKeys.isEmpty ||
            _cellKeys.any((element) => element.first.currentContext == null)
        ? []
        : _arrows.map((e) => Arrow(from: e.first, to: e.second)).toList();
  }

  //#endregion

  //#region Actions

  /// Callback for when a cell is tapped
  ///
  /// It will redirect to the correct method
  /// If in plan mode, it will redirect to [_onPlanModeCellTapped]
  /// If a piece is selected, it will redirect to [_pieceSelection]
  /// If a cell is selected, it will redirect to [_cellSelection]
  void _onCellTappedDetector(Cell cell, GlobalObjectKey key) {
    // Redirect if in plan mode
    if (_planMode) {
      _onPlanModeCellTapped(key);
      return;
    }

    // Handle selection
    if (plannedCells.first != null) {
      _cellSelection(cell);
    } else {
      _pieceSelection(cell);
    }
  }

  /// Callback for when a cell is tapped in plan mode
  ///
  /// It will select the cell if it is not selected
  /// If it is selected, it will create an arrow from the selected cell to the current cell
  /// If the arrow already exists, it will remove it
  /// If the arrow does not exist, it will create it
  void _onPlanModeCellTapped(GlobalObjectKey key) {
    // If no cell is selected, select the current one
    if (_selectedCellKey == null) {
      _selectedCellKey = key;
      return;
    }

    // If selecetd cell is the same as the one tapped, deselect it
    if (_selectedCellKey! == key) {
      _selectedCellKey = null;
      return;
    }

    // Check if the arrow already exists
    final isCancelRequest = _arrows.any(
      (element) => element.first == _selectedCellKey! && element.second == key,
    );

    // Remove the arrow if it exists, create it if it does not
    if (isCancelRequest) {
      _arrows.removeWhere(
        (element) =>
            element.first == _selectedCellKey! && element.second == key,
      );
      _selectedCellKey = null;
    } else {
      _arrows.add(Tuple(_selectedCellKey!, key));
    }
    _selectedCellKey = null;
    setState(() {});
  }

  /// Callback for when the user decides to move a piece
  ///
  /// It will send a request to the server and handle the response
  /// If the move is valid, it will update the board
  /// If the move is invalid, it will show an error message
  /// If the move is a pawn promotion, it will show a dialog to choose the piece
  void _cellSelection(Cell cell) async {
    // If selected piece is the same as the one selected, deselect it
    if (cell.piece == plannedCells.first) {
      plannedCells.second.clear();
      plannedCells.first = null;
      setState(() {});
      return;
    }

    // If the cell is not empty and the piece is the same color as the turn, select it
    if (cell.piece != null && cell.piece!.color == turn) {
      plannedCells.second.clear();
      plannedCells.first = cell.piece;
      _pieceSelection(cell);
      return;
    }

    // Request the move to the API
    final pieceCell = board.cells.firstWhere(
      (element) => element.piece == plannedCells.first,
    );
    final moveRequest = Move(pieceCell, cell);
    final moveResult = await PuzzleBoardAPI().move(
      moveRequest,
      onPawnPromotion: () =>
          showPawnPromotionPanel(context, pieceCell.piece!.color),
    );
    if (moveResult.isLeft()) {
      _snackbarError(moveResult.left);
      return;
    }

    // Update the board
    board = moveResult.right;
    plannedCells.first = null;
    plannedCells.second.clear();
    _invertTurn();

    _refreshThreats();

    setState(() {});
  }

  /// Callback for when the user selects a piece
  ///
  /// It will show the possible moves for the piece
  void _pieceSelection(Cell cell) async {
    if (cell.piece == null) return;

    // Request the possible moves to the API
    final paths = await PuzzleBoardAPI().planPath(cell);
    if (paths.isLeft()) {
      _snackbarError(paths.left);
      return;
    }

    // Update the board
    final cells = paths.right;
    plannedCells.second.clear();
    plannedCells.second.addAll(cells);
    plannedCells.first = cell.piece;
    setState(() {});
  }

  /// Shows an error message
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

  /// Inverts the turn
  void _invertTurn() {
    if (turn == PieceColor.white) {
      turn = PieceColor.black;
    } else {
      turn = PieceColor.white;
    }
  }

  /// Get the Key reference of the given cell
  /// If the cell is not in the list, it will add it and then return its key
  GlobalObjectKey _getCellKey(Cell cell) {
    late GlobalObjectKey key;
    if (_cellKeys.any((element) => element.second == cell)) {
      key = _cellKeys.firstWhere((element) => element.second == cell).first;
    } else {
      key = GlobalObjectKey(cell);
      _cellKeys.add(Tuple(key, cell));
    }
    return key;
  }

  /// Returns the color of the given cell
  ///
  /// If the cell is in the planned cells, it will return the planned cells color
  /// If the cell is the selected piece, it will return the selected piece color
  /// Otherwise, it will return the color of the cell
  Color _getCurrentCellColor(Cell cell) {
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

    return cellColor;
  }

  /// Returns a random puzzle from the database
  /// Resets the board and the turn
  void _setupNewPuzzle({bool debugPuzzle = false}) {
    // New keys will be generated
    _cellKeys.clear();

    // Load a new puzzle
    puzzle =
        debugPuzzle ? Puzzle.fromLichessDB(puzzleDb.first) : getRandomPuzzle();

    // Setup the board
    final boardRequest = PuzzleBoardAPI().fromFen(puzzle.fen);
    if (boardRequest.isLeft()) {
      _snackbarError(boardRequest.left);
      board = Board.empty();
    } else {
      board = boardRequest.right;
    }

    // Setup the turn
    turn = puzzle.fen.turn;

    // Calculate the threats
    _refreshThreats();
  }

  /// Refreshes the UI threats for both kings
  void _refreshThreats() {
    setState(() {
      _whiteKingThreats = PuzzleBoardAPI().getKingThreats(PieceColor.white);
      _blackKingThreats = PuzzleBoardAPI().getKingThreats(PieceColor.black);
    });
  }

  /// Perform the previous played move on the board
  void _onPreviousMove() {
    final previousMove = PuzzleBoardAPI().previousMove();
    if (previousMove.isLeft()) {
      _snackbarError(previousMove.left);
      return;
    }
    Board requestedMove = previousMove.right;
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
  }

  /// Perform the next played move on the board
  void _onNextMove() {
    final nextmove = PuzzleBoardAPI().nextMove();
    if (nextmove.isLeft()) {
      _snackbarError(nextmove.left);
      return;
    }
    Board requestedMove = nextmove.right;
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
  }

  //#endregion
}
