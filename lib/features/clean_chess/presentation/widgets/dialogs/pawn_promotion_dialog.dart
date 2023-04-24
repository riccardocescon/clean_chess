import 'package:cleanchess/core/utilities/extentions.dart';
import 'package:dartchess/dartchess.dart';
import 'package:flutter/material.dart';
import 'package:cleanchess/core/utilities/assets.dart' as assets;

Future<Role> showPromotionDialog(BuildContext context, Side turn) async {
  Role? role = await showGeneralDialog<Role>(
    context: context,
    barrierDismissible: false,
    pageBuilder: (context, _, __) {
      return PawnPromotionDialog(turn: turn);
    },
  );
  return role!;
}

class PawnPromotionDialog extends StatelessWidget {
  const PawnPromotionDialog({super.key, required this.turn});

  final Side turn;

  final piecePadding = 5.0;

  final dialogRadius = 8.0;

  final pieceScale = 4.5;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        backgroundColor: Colors.transparent,
        content: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(
              piecePadding * 2,
              piecePadding * 2,
              piecePadding * 2,
              piecePadding,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(dialogRadius),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                assets.whitePromotionPieces.length,
                (index) {
                  final promotions = _getPieces(turn);
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(
                        context,
                        promotions[index].role,
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: piecePadding),
                      child: Image.asset(
                        assets.getPiecePath(promotions[index]),
                        scale: pieceScale,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Piece> _getPieces(Side side) {
    return turn.isWhite
        ? assets.whitePromotionPieces
        : assets.blackPromotionPieces;
  }
}
