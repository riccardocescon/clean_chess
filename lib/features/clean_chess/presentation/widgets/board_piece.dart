import 'package:cleanchess/features/clean_chess/presentation/widgets/animated_board_piece.dart';
import 'package:dartchess/dartchess.dart';
import 'package:flutter/material.dart';
import 'package:cleanchess/core/utilities/assets.dart' as assets;

class BoardPiece extends StatelessWidget {
  const BoardPiece({
    super.key,
    required this.piece,
    this.scale = 1,
    this.pieceAnim = PieceAnimation.none,
  });

  final Piece piece;
  final double scale;
  final PieceAnimation pieceAnim;

  Widget get _piece => Image.asset(
        assets.getPiecePath(piece),
        scale: scale,
      );

  @override
  Widget build(BuildContext context) {
    return _piece;
  }
}
