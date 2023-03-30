import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

class Chessboard extends StatefulWidget {
  const Chessboard({super.key, this.fen});

  final String? fen;

  @override
  State<Chessboard> createState() => _ChessboardState();
}

class _ChessboardState extends State<Chessboard> {
  late ChessBoardController _controller;

  static const String _kEmptyBoard = '8/8/8/8/8/8/8/8 w - - 0 1';

  @override
  void initState() {
    super.initState();
    _controller = ChessBoardController();
  }

  @override
  void didUpdateWidget(covariant Chessboard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.fen != widget.fen) {
      _controller.loadFen(widget.fen ?? _kEmptyBoard);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChessBoard(
      controller: _controller,
      boardColor: BoardColor.orange,
      arrows: [
        // BoardArrow(
        //   from: 'd2',
        //   to: 'd4',
        //   color: Colors.green.withOpacity(0.5),
        // ),
      ],
      boardOrientation: PlayerColor.white,
    );
  }
}
