import 'package:cleanchess/core/chesskit/utilities/snackbar.dart';
import 'package:cleanchess/core/clean_chess/utilities/snackbar.dart';
import 'package:cleanchess/core/utilities/extentions.dart';
import 'package:cleanchess/features/chesskit/chesskit.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/chessboard.dart';
import 'package:dartchess/dartchess.dart';
import 'package:flutter/material.dart';

class ChessboardInterpreter extends StatefulWidget {
  const ChessboardInterpreter({super.key, this.setup = Setup.standard});

  final Setup setup;

  @override
  State<ChessboardInterpreter> createState() => _ChessboardInterpreterState();
}

class _ChessboardInterpreterState extends State<ChessboardInterpreter> {
  late ChessKit _chessKit;

  Square? _selectedSquare;
  Piece? _selectedPiece;
  List<Square> _selectedSquares = [];

  @override
  void initState() {
    _chessKit = ChessKit(widget.setup);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Chessboard(
        onCellTap: _onCellTap,
        selectedSquares: _selectedSquares,
        selectedSquare: _selectedSquare,
        pieces: _chessKit.pieces,
      );

  /// Callback for when a cell is tapped.
  /// Handles the logic for selecting and moving pieces
  /// and shows an error message if the move is invalid
  void _onCellTap(Square cell) {
    // Handle first tap
    if (_selectedSquare == null) {
      _handleFirstTap(cell);
      return;
    }

    // Handle deselection if the same square is tapped twice
    if (_selectedSquare == cell) {
      _resetSelection();
      return;
    }

    // Handle second tap
    assert(_selectedPiece != null);

    // Assert that the cell is a legal move
    if (!_selectedSquares.contains(cell)) {
      // If tapped another piece of the same team, select it
      if (_hasSameTeamPiece(cell, _selectedPiece!.color)) {
        _resetSelection();
        _handleFirstTap(cell);
        return;
      }
      return;
    }
    final uci = "${_indexToCoord(_selectedSquare!)}${_indexToCoord(cell)}";
    _handleMove(uci);

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
    _selectedPiece = piece;
    _selectedSquare = cell;

    // Get the legal moves for the piece
    _selectedSquares.clear();
    _selectedSquares.addAll(_chessKit.getLegalMoves(cell));

    setState(() {});
  }

  /// Handles the logic for moving a piece
  /// and shows an error message if the move is invalid
  void _handleMove(String uci) {
    final move = _chessKit.move(uci);
    if (move.isLeft()) {
      showChesskitSnackbarError(context, move.left);
      return;
    }
  }

  //#endregion

  //#region Utilities

  /// Converts an index to a coordinate string
  /// e.g. 0 -> a1, 63 -> h8
  String _indexToCoord(Square square) {
    final int file = square % 8;
    final int rank = (square - file) ~/ 8;

    final String fileString = String.fromCharCode(file + 97);
    final String rankString = (rank + 1).toString();

    return fileString + rankString;
  }

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
    _selectedSquare = null;
    _selectedPiece = null;
    _selectedSquares.clear();
    setState(() {});
  }

  //#endregion
}
