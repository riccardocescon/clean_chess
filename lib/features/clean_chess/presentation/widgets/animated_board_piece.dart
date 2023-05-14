import 'package:cleanchess/core/utilities/extentions.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/board_piece.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/glitch.dart';
import 'package:dartchess/dartchess.dart';
import 'package:flutter/material.dart';

class AnimatedBoardPiece extends StatelessWidget {
  const AnimatedBoardPiece({
    super.key,
    required this.onGetPiece,
    this.scale = 10,
    this.pieceAnim = PieceAnimation.none,
    this.duration = const Duration(milliseconds: 500),
  });

  final Piece? Function() onGetPiece;
  final double scale;
  final PieceAnimation pieceAnim;
  final Duration duration;

  Widget _getBoardPiece(Piece piece) {
    return BoardPiece(
      piece: piece,
      scale: scale,
      pieceAnim: pieceAnim,
    );
  }

  @override
  Widget build(BuildContext context) {
    final pieceExists = onGetPiece();
    if (pieceExists != null && pieceAnim == PieceAnimation.none) {
      return _getBoardPiece(pieceExists);
    }
    return AnimatedSwitcher(
      transitionBuilder: (child, animation) =>
          pieceAnim.builder(animation, child),
      duration: duration,
      child: pieceExists != null
          ? BoardPiece(
              piece: pieceExists,
              scale: scale,
              pieceAnim: pieceAnim,
            )
          : null,
    );
  }
}

enum PieceAnimation {
  none(0),
  scale(1),
  ghost(2),
  glitch(3);

  const PieceAnimation(this.id);

  final int id;
}

extension PieceAnimationBuilder on PieceAnimation {
  String get name {
    final names = {
      PieceAnimation.none: 'None'.hardcoded,
      PieceAnimation.scale: 'Scale'.hardcoded,
      PieceAnimation.ghost: 'Ghost'.hardcoded,
      PieceAnimation.glitch: 'Glitch'.hardcoded,
    };
    return names[this]!;
  }

  Widget builder(Animation<double> animation, Widget child) {
    switch (this) {
      case PieceAnimation.none:
        return const SizedBox();
      case PieceAnimation.scale:
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      case PieceAnimation.ghost:
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      case PieceAnimation.glitch:
        return GlitchTransition(
          effect: animation,
          child: child,
        );
    }
  }
}
