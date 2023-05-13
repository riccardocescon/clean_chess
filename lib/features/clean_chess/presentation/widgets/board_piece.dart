import 'package:cleanchess/features/clean_chess/presentation/widgets/animated_board_piece.dart';
import 'package:dartchess/dartchess.dart';
import 'package:flutter/material.dart';
import 'package:cleanchess/core/utilities/assets.dart' as assets;
import 'package:flutter_svg/svg.dart';

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

  Widget get _piece => Transform.scale(
        scale: scale / 10,
        child: SvgPicture.asset(
          assets.getPiecePath(piece),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return _piece;
  }
}
