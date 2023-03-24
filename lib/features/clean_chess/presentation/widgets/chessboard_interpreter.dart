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
    if (_selectedSquare == null) {
      _selectedSquare = cell;
      setState(() {});
      return;
    }

    if (_selectedSquare == cell) {
      _selectedSquare = null;
      setState(() {});
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
