import 'package:clean_chess/chess/abstractions/piece.dart';
import 'package:clean_chess/chess/core/utilities/enums.dart';
import 'package:clean_chess/chess/models/pieces.dart';
import 'package:clean_chess/core/clean_chess/presentation/widgets/pawn_promotion_widget.dart';
import 'package:flutter/material.dart';

Future<Piece> showPawnPromotionPanel(
  BuildContext context,
  PieceColor turn,
) async =>
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: turn == PieceColor.white
                      ? Colors.grey.shade300
                      : Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    pawnPromotionPiece(context, Queen(turn)),
                    const SizedBox(height: 10),
                    pawnPromotionPiece(context, Rook(turn)),
                    const SizedBox(height: 10),
                    pawnPromotionPiece(context, Bishop(turn)),
                    const SizedBox(height: 10),
                    pawnPromotionPiece(context, Knight(turn)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
