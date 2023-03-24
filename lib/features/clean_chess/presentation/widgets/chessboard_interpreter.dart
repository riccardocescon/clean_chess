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

  @override
  void initState() {
    _chessKit = ChessKit(widget.setup);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Chessboard(
        onCellTap: _onCellTap,
        selectedSquares: const [],
        selectedSquare: _selectedSquare,
        pieces: _chessKit.pieces,
      );

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
    final uci = "${_indexToCoord(_selectedSquare!)}${_indexToCoord(cell)}";
    _handleMove(uci);

    _resetSelection();
  }

  void _handleFirstTap(Square cell) {
    // Assert that there is a piece on the cell
    final pieceOnCell = _chessKit.pieces.any(
      (element) => element.item1 == cell,
    );
    if (!pieceOnCell) return;

    // Select the piece
    _selectedPiece =
        _chessKit.pieces.firstWhere((element) => element.item1 == cell).item2;
    _selectedSquare = cell;
    setState(() {});
  }

  void _resetSelection() {
    _selectedSquare = null;
    _selectedPiece = null;
    setState(() {});
  }

  void _handleMove(String uci) {
    final move = _chessKit.move(uci);
    if (move.isLeft()) {
      showChesskitSnackbarError(context, move.left);
      return;
    }
  }

  String _indexToCoord(Square square) {
    final int file = square % 8;
    final int rank = (square - file) ~/ 8;

    final String fileString = String.fromCharCode(file + 97);
    final String rankString = (rank + 1).toString();

    return fileString + rankString;
  }
}
