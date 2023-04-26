import 'package:cleanchess/core/utilities/enum_themes.dart';
import 'package:cleanchess/core/utilities/parser.dart' as parser;
import 'package:cleanchess/features/clean_chess/presentation/widgets/animated_board_piece.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/chessboard_interpreter.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/dialogs/pawn_promotion_dialog.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/titled_app_bar.dart';
import 'package:dartchess/dartchess.dart';
import 'package:flutter/material.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class PuzzleOfTheDayPage extends StatelessWidget {
  const PuzzleOfTheDayPage({
    super.key,
    required this.puzzle,
    required this.pieceAnimation,
    required this.boardTheme,
  });

  final LichessPuzzle puzzle;
  final PieceAnimation pieceAnimation;
  final BoardTheme boardTheme;

  @override
  Widget build(BuildContext context) {
    final PuzzleController controller = PuzzleController(
      setup: Setup.parseFen(
        parser.pgnToFen(puzzle.game!.pgn!),
      ),
    );
    return BaseScaffold(
      body: _body(context, controller),
      title: 'Puzzle',
      subtitle: 'Puzzle of the day',
    );
  }

  Widget _body(BuildContext context, PuzzleController controller) {
    return Column(
      children: [
        ChessboardInterpreter(
          controller: controller,
          onPromotion: (piece) async {
            return await showPromotionDialog(context, Side.black);
          },
          pieceAnimation: pieceAnimation,
          boardTheme: boardTheme,
        ),
      ],
    );
  }
}
