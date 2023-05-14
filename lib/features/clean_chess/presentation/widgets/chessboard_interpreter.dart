import 'package:cleanchess/core/clean_chess/utilities/snackbar.dart';
import 'package:cleanchess/core/utilities/debug.dart';
import 'package:cleanchess/core/utilities/extentions.dart';
import 'package:cleanchess/features/chesskit/chesskit.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/in_game/puzzle_mode_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/chessboard.dart';
import 'package:cleanchess/injection_container.dart';
import 'package:dartchess/dartchess.dart';
import 'package:flutter/material.dart';

class ChessboardInterpreter extends StatefulWidget {
  const ChessboardInterpreter({
    super.key,
    required this.controller,
    required this.onPromotion,
  });

  final ChessboardController controller;
  final Future<Role> Function(Side) onPromotion;

  @override
  State<ChessboardInterpreter> createState() => _ChessboardInterpreterState();
}

class _ChessboardInterpreterState extends State<ChessboardInterpreter> {
  ChessboardController get _controller => widget.controller;
  ChessKit get _chessKit => _controller._chessKit;

  @override
  void initState() {
    widget.controller.addListener(_onControllerEvent);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerEvent);
    super.dispose();
  }

  void _onControllerEvent() {
    if (widget.controller._moves.isEmpty) return;
    setState(() {
      final fen =
          widget.controller._moves[widget.controller._pCurrentMove].item1;
      widget.controller._chessKit = ChessKit(Setup.parseFen(fen));
      if (_controller is PuzzleController) {
        if ((_controller as PuzzleController)._simulateTap != null) {
          _onCellTap((_controller as PuzzleController)._simulateTap!);
          (_controller as PuzzleController)._simulateTap = null;
        }
      }
    });
  }

  @override
  void didUpdateWidget(covariant ChessboardInterpreter oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.controller.setup != widget.controller.setup) {
      widget.controller._chessKit = ChessKit(widget.controller.setup);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Chessboard(
        onCellTap: _controller._interactable ? _onCellTap : null,
        selectedSquares: _controller._selectedSquares,
        selectedSquare: _controller._selectedSquare,
        pieces: _chessKit.pieces,
        boardSide: _controller._boardSide,
      ),
    );
  }

  /// Callback for when a cell is tapped.
  /// Handles the logic for selecting and moving pieces
  /// and shows an error message if the move is invalid
  void _onCellTap(Square cell) async {
    // Assert it is interactable
    if (!_controller._interactable) return;

    // Assert that the game is not in replay mode
    //
    // For Puzzle Mode, there is 1 bonus move on the list
    // that is the autoPlayed bot move, so we need to subtract 1
    final pointinLastMove = _controller._pCurrentMove ==
        _controller._moves.length - (_controller is PuzzleController ? 1 : 0);
    if (_controller._moves.isNotEmpty && !pointinLastMove) {
      showSnackbar(
        context: context,
        message: 'Cannot move in replay mode',
        backgroundColor: Colors.grey.shade700,
        duration: const Duration(seconds: 1),
      );
      return;
    }

    // Handle first tap
    if (_controller._selectedSquare == null) {
      _handleFirstTap(cell);
      return;
    }

    // Handle deselection if the same square is tapped twice
    if (_controller._selectedSquare == cell) {
      _resetSelection();
      return;
    }

    // Handle second tap
    assert(_controller._selectedPiece != null);

    // Assert that the cell is a legal move
    if (!_controller._selectedSquares.contains(cell)) {
      // If tapped another piece of the same team, select it
      if (_hasSameTeamPiece(cell, _controller._selectedPiece!.color)) {
        _resetSelection();
        _handleFirstTap(cell);
        return;
      }
      return;
    }
    //Verify if selecyedSquare! and cell are a pawn promotion
    NormalMove move = NormalMove(from: _controller._selectedSquare!, to: cell);
    if (_chessKit.isPromotion(move)) {
      Role role = await widget.onPromotion(_chessKit.turn);
      move = NormalMove(
          from: _controller._selectedSquare!, to: cell, promotion: role);
    }
    _handleMove(move);

    _resetSelection();
  }

  //#region Handlers

  /// Handles the logic for selecting a piece
  ///
  /// The cell must contain a piece of the current turn
  void _handleFirstTap(Square cell) {
    // Assert that there is a piece on the cell
    final pieceOnCell = _chessKit.pieces.any(
      (element) => element.item1 == cell,
    );
    if (!pieceOnCell) return;

    // Assert that the Turn is correct
    final piece =
        _chessKit.pieces.firstWhere((element) => element.item1 == cell).item2;
    if (piece.color != _chessKit.turn) {
      return;
    }

    // Select the piece
    _controller._selectedPiece = piece;
    _controller._selectedSquare = cell;

    // Get the legal moves for the piece
    _controller._selectedSquares.clear();
    _controller._selectedSquares.addAll(_chessKit.getLegalMoves(cell));

    setState(() {});
  }

  /// Handles the logic for moving a piece
  /// and shows an error message if the move is invalid
  void _handleMove(NormalMove move) {
    final moveRes = _chessKit.move(move.uci);
    if (moveRes.isLeft()) {
      // showChesskitSnackbarError(context, move.left);
      return;
    }

    _controller._moves.add(Tuple2(_chessKit.fen, move));
    _controller._pCurrentMove++;
    sl<PuzzleModeCubit>().pieceMoved(move);

    if (_chessKit.gameEnded) {
      final outcome = _chessKit.outcome;
      if (outcome.winner == null) {
        print("Draw");
      } else {
        print("${outcome.winner} won");
      }
    }
  }

  //#endregion

  //#region Utilities

  /// Verifies if the cell contains a piece of the given color
  bool _hasSameTeamPiece(Square cell, Side color) {
    final pieceOnCell = _chessKit.pieces.any(
      (element) => element.item1 == cell,
    );
    if (!pieceOnCell) return false;

    final piece =
        _chessKit.pieces.firstWhere((element) => element.item1 == cell).item2;
    return piece.color == color;
  }

  /// Resets all selected squares and pieces
  void _resetSelection() {
    _controller._selectedSquare = null;
    _controller._selectedPiece = null;
    _controller._selectedSquares.clear();
    setState(() {});
  }

  //#endregion
}

abstract class ChessboardController extends ChangeNotifier {
  /// Chesskit instance for this Widget
  /// It will handle all the logic for the game
  late ChessKit _chessKit;
  late Setup setup;

  bool _interactable = true;

  Side _boardSide = Side.white;

  //#region UI variables
  /// The currently selected square
  Square? _selectedSquare;

  /// The currently selected piece
  Piece? _selectedPiece;

  /// The squares that are legal moves for the [_selectedPiece]
  final List<Square> _selectedSquares = [];
  //#endregion

  final List<Tuple2<String, Move>> _moves = [];
  int _pCurrentMove = 0;

  ChessboardController({
    required this.setup,
    Side? boardSide,
    bool? interactable,
  }) {
    _chessKit = ChessKit(setup);
    if (boardSide != null) _boardSide = boardSide;
    if (interactable != null) _interactable = interactable;
  }

  void previousMove() {
    if (_pCurrentMove > 0) {
      _pCurrentMove--;
      notifyListeners();
    }
  }

  void nextMove() {
    if (_pCurrentMove < _moves.length - 1) {
      _pCurrentMove++;
      notifyListeners();
    }
  }

  void undoMove() {
    if (_pCurrentMove > 0) {
      _pCurrentMove--;
      _moves.removeLast();
      notifyListeners();
    }
  }

  bool autoPlayMove(String uci) {
    final move = Move.fromUci(uci)!;
    final res = _chessKit.move(move.uci);
    if (res.isLeft()) {
      logDebug(res.left.message, color: LogColor.red);
      return false;
    }
    _moves.add(Tuple2(_chessKit.fen, move));
    _pCurrentMove++;
    notifyListeners();
    return true;
  }

  /// Converts an index to a coordinate string
  /// e.g. 0 -> a1, 63 -> h8
  String _indexToCoord(Square square) {
    final int file = square % 8;
    final int rank = (square - file) ~/ 8;

    final String fileString = String.fromCharCode(file + 97);
    final String rankString = (rank + 1).toString();

    return fileString + rankString;
  }

  Square _coordToIndex(String coord) {
    final int file = coord.codeUnitAt(0) - 97;
    final int rank = int.parse(coord[1]) - 1;

    return rank * 8 + file;
  }

  void setInteractable(bool value) {
    _interactable = value;
    notifyListeners();
  }

  void loadFen(String fen) {
    _reset();
    _chessKit = ChessKit(Setup.parseFen(fen));
    sl<PuzzleModeCubit>().turnOf(_chessKit.turn);
    notifyListeners();
  }

  void _reset() {
    _chessKit = ChessKit(setup);
    _moves.clear();
    _pCurrentMove = 0;
    _selectedPiece = null;
    _selectedSquare = null;
    _interactable = true;
    _selectedSquares.clear();
    notifyListeners();
  }

  void flipBoard() {
    _boardSide = _boardSide == Side.white ? Side.black : Side.white;
    notifyListeners();
  }

  void setBoardSide(Side side) {
    _boardSide = side;
    notifyListeners();
  }
}

class BaseController extends ChessboardController {
  BaseController({Setup setup = Setup.standard, Side boardSide = Side.white})
      : super(setup: setup, boardSide: boardSide);
}

class PuzzleController extends ChessboardController {
  PuzzleController({
    Setup setup = Setup.standard,
    Side boardSide = Side.white,
    bool interactable = true,
  }) : super(
          setup: setup,
          boardSide: boardSide,
          interactable: interactable,
        );

  @override
  void loadFen(String fen) {
    _reset();
    _chessKit = ChessKit(Setup.parseFen(fen));
    sl<PuzzleModeCubit>().turnOf(_chessKit.turn);
    _moves.add(
      Tuple2(_chessKit.fen, const NormalMove(from: -1, to: -1)),
    );
    notifyListeners();
  }

  Square? _simulateTap;
  void highLightHintCell(String uci) {
    final move = Move.fromUci(uci)!;
    if (move is NormalMove) {
      _simulateTap = move.from;
    } else if (move is DropMove) {
      //TODO: How to handle this?
      // cannot make move.to -1 row because it may be promoted while eating diagonally
      logDebug(
        'Drop move Not supported yet!',
        color: LogColor.pink,
        tag: 'PuzzleController',
      );
      return;
    }
    notifyListeners();
  }

  void forceUserMove(String uci) {
    autoPlayMove(uci);
    _selectedPiece = null;
    _selectedSquare = null;
    _selectedSquares.clear();
    final move = Move.fromUci(uci)!;
    sl<PuzzleModeCubit>().pieceMoved(move);
  }
}
