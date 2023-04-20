import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:cleanchess/core/utilities/assets.dart' as assets;
import 'package:dartchess/dartchess.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Chessboard extends StatelessWidget {
  const Chessboard({
    super.key,
    this.onCellTap,
    this.selectedSquares = const [],
    this.selectedSquare,
    this.pieces = const [],
    this.boardSide = Side.white,
  });

  /// Callback for when a cell is tapped.
  final Function(Square)? onCellTap;

  /// List of squares that should be highlighted
  final List<Square> selectedSquares;

  /// The square that should be highlighted as 'Selected'
  final Square? selectedSquare;

  final List<Tuple2<Square, Piece>> pieces;

  /// Getter for whether the board is interactable
  bool get _tappable => onCellTap != null;

  /// Getter for the splash color
  Color get _splashColor => _tappable ? Colors.pink : Colors.transparent;

  final Side boardSide;

  @override
  Widget build(BuildContext context) {
    final board = _flipBoard(
      child: GridView.builder(
        itemCount: 64,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
        ),
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (_, index) => _cell(index),
      ),
    );
    if (boardSide == Side.white) {
      return board;
    }

    return Transform.rotate(
      angle: math.pi,
      child: board,
    );
  }

  Widget _cell(int index) {
    final cell = MaterialButton(
      onPressed: () => _tappable ? onCellTap?.call(index) : null,
      elevation: 0,
      padding: EdgeInsets.zero,
      splashColor: _splashColor,
      color: _getColor(index),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero),
      ),
      child: pieces.any((element) => element.item1 == index)
          ? _piece(index)
          : null,
    );
    if (boardSide == Side.white) {
      return _flipBoard(child: cell);
    }
    return cell;
  }

  /// Flips the board vertically
  ///
  /// This is done by rotating the board 180 degrees around the x-axis.
  ///
  /// This is done because the board is drawn from the top left corner
  /// and the ChessKit library uses the bottom left corner as the origin.
  /// So by flipping the board, the board is drawn from the bottom left
  /// And by re-flipping each cell, we get the correct orientation.
  Widget _flipBoard({required Widget child}) => Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationX(math.pi),
        child: child,
      );

  /// Returns the correct piece image for the given piece
  Widget _piece(Square square) {
    final piece = pieces.firstWhere((element) => element.item1 == square).item2;
    return Image.asset(
      assets.getPiecePath(piece),
      scale: 8,
    );
  }

  /// Returns the correct color for the given cell
  Color _getColor(int index) {
    if (selectedSquares.contains(index)) {
      return Colors.indigo;
    }
    if (index == selectedSquare) {
      return Colors.pink;
    }
    return getCellColor(index);
  }
}
