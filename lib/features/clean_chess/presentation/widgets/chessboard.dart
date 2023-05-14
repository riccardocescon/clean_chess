import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:cleanchess/core/utilities/enum_themes.dart';
import 'package:cleanchess/features/clean_chess/data/models/user_settings_model.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/animated_board_piece.dart';
import 'package:cleanchess/injection_container.dart';
import 'package:dartchess/dartchess.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:cleanchess/core/utilities/secure_storage_helper.dart'
    as secure_storage_helper;

PieceAnimation? _pieceAnimation;

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
  final void Function(Square)? onCellTap;

  /// List of squares that should be highlighted
  final List<Square> selectedSquares;

  /// The square that should be highlighted as 'Selected'
  final Square? selectedSquare;

  final List<Tuple2<Square, Piece>> pieces;

  /// Getter for whether the board is interactable
  bool get _tappable => onCellTap != null;

  /// Getter for the splash color
  Color get _splashColor => _tappable ? Colors.pink : Colors.transparent;

  BoardTheme get _boardTheme => sl<UserSettingsModel>().boardTheme;

  final Side boardSide;

  @override
  Widget build(BuildContext context) {
    final board = StatefulBuilder(builder: (context, localSetState) {
      _loadPieceAnimation(localSetState);
      return _flipBoard(
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
    });
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
      child: AnimatedBoardPiece(
        onGetPiece: () => _getPiece(index),
        duration: const Duration(milliseconds: 500),
        scale: 8,
        pieceAnim: _pieceAnimation!,
      ),
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
  Widget _flipBoard({required Widget child}) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationX(math.pi),
      child: child,
    );
  }

  /// Returns the piece at the given index
  Piece? _getPiece(int index) {
    if (pieces.any((element) => element.item1 == index)) {
      return pieces.firstWhere((element) => element.item1 == index).item2;
    }
    return null;
  }

  /// Returns the correct color for the given cell
  Color _getColor(int index) {
    if (selectedSquares.contains(index)) {
      return Colors.indigo;
    }
    if (index == selectedSquare) {
      return Colors.pink;
    }
    return getCellColor(
      index,
      whiteColor: _boardTheme.lightColor,
      blackColor: _boardTheme.darkColor,
    );
  }

  PieceAnimation _loadPieceAnimation(StateSetter localSetState) {
    _pieceAnimation =
        sl<UserSettingsModel>().displaySettingsModel.pieceAnimation;
    if (_pieceAnimation == null) {
      _pieceAnimation = PieceAnimation.none;
      secure_storage_helper.getAnimationType().then(
            (value) => localSetState(
              () {
                _pieceAnimation = value;
              },
            ),
          );
    }
    return _pieceAnimation!;
  }
}
