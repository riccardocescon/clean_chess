import 'package:cleanchess/core/clean_chess/utilities/style.dart';
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

  Color get _splashColor => _tappable ? Colors.pink : Colors.transparent;

  @override
  Widget build(BuildContext context) => _flipBoard(
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

  Widget _cell(int index) => _flipBoard(
        child: MaterialButton(
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
        ),
      );

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
      _getPieceImage(piece),
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

  /// Converts a [Piece] to the correct image path
  String _getPieceImage(Piece piece) {
    final paths = {
      Piece.whitePawn: 'assets/pieces/flat/white_pawn.png',
      Piece.whiteKnight: 'assets/pieces/flat/white_knight.png',
      Piece.whiteBishop: 'assets/pieces/flat/white_bishop.png',
      Piece.whiteRook: 'assets/pieces/flat/white_rook.png',
      Piece.whiteQueen: 'assets/pieces/flat/white_queen.png',
      Piece.whiteKing: 'assets/pieces/flat/white_king.png',
      Piece.blackPawn: 'assets/pieces/flat/black_pawn.png',
      Piece.blackKnight: 'assets/pieces/flat/black_knight.png',
      Piece.blackBishop: 'assets/pieces/flat/black_bishop.png',
      Piece.blackRook: 'assets/pieces/flat/black_rook.png',
      Piece.blackQueen: 'assets/pieces/flat/black_queen.png',
      Piece.blackKing: 'assets/pieces/flat/black_king.png',
    };

    return paths[piece]!;
  }
}
