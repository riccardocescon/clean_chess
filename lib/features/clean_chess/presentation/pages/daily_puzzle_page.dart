import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:cleanchess/core/utilities/extentions.dart';
import 'package:cleanchess/core/utilities/parser.dart' as parser;
import 'package:cleanchess/features/clean_chess/data/models/puzzle_model.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/in_game/puzzle_mode_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/pages/puzzle_page.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/chessboard_interpreter.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/dialogs/pawn_promotion_dialog.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/puzzle_mode/puzzle_hint_button.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/puzzle_mode/puzzle_message_bar.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/titled_app_bar.dart';
import 'package:dartchess/dartchess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';
import 'package:cleanchess/core/utilities/secure_storage_helper.dart'
    as secure_storage_helper;

int _hintCount = 0;
int _retries = 0;

late PuzzleController _controller;
PuzzleModel? _puzzle;

final Color _bottomNavBarBgColor = Colors.grey.shade900;

class DailyPuzzlePage extends StatelessWidget {
  const DailyPuzzlePage({
    super.key,
    required this.puzzle,
    required this.userId,
  });

  final LichessPuzzle puzzle;
  final String userId;
  bool _puzzleCompleted(String lastMove) =>
      _puzzle!.moves.length == 1 && lastMove == _puzzle!.moves.first;

  @override
  Widget build(BuildContext context) {
    _puzzle = PuzzleModel.fromLichessPuzzle(puzzle);
    final parsedPgn = parser.parsePGN(puzzle.game!.pgn!);
    _controller = PuzzleController(boardSide: parsedPgn.item2);
    _controller.loadFen(parsedPgn.item1);
    return BaseScaffold(
      body: _body(context),
      title: 'Puzzle',
      subtitle: 'Puzzle of the day',
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        _topBar(),
        _board(context),
        _bottomBar(),
      ],
    );
  }

  //#region Top
  Widget _topBar() {
    return BlocConsumer<PuzzleModeCubit, PuzzleModeState>(
      listener: _topBarListener,
      builder: (context, state) {
        return PuzzleMessageBarBuilder(
          context: context,
          state: state,
          isPuzzleCompleted: _puzzleCompleted,
          onGetHintCount: () => _hintCount,
          onGetRetriesCount: () => _retries,
          onGetNextMove: () => _puzzle!.moves.first,
          onNextMoveValidated: () => _puzzle!.moves.removeAt(0),
        );
      },
    );
  }
  //#endregion

  //#region Board
  Widget _board(BuildContext context) {
    return BlocListener<PuzzleModeCubit, PuzzleModeState>(
      listener: _boardListener,
      child: Expanded(
        child: Align(
          alignment: Alignment.center,
          child: Hero(
            tag: 'chessboard',
            child: ChessboardInterpreter(
                controller: _controller,
                onPromotion: (piece) async {
                  return await showPromotionDialog(context, Side.black);
                }),
          ),
        ),
      ),
    );
  }
  //#endregion

  //#region Bottom
  Widget _bottomBar() {
    return Container(
      color: _bottomNavBarBgColor,
      child: BlocBuilder<PuzzleModeCubit, PuzzleModeState>(
        builder: (context, state) {
          return state.maybeMap(
            pieceMoved: (value) {
              if (_puzzleCompleted(value.move.uci)) {
                return _startPuzzleMode(context);
              } else {
                return _puzzleHintButton();
              }
            },
            orElse: () => _puzzleHintButton(),
          );
        },
      ),
    );
  }

  Widget _puzzleHintButton() {
    return PuzzleHintButton(
      onHintPressed: () => _hintCount++,
      onGetNextMove: () => _puzzle!.moves.first,
      onGetHintCell: (move) => _controller.highLightHintCell(move),
      onForceUserMove: (move) => _controller.forceUserMove(move),
    );
  }

  Widget _startPuzzleMode(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return PuzzlePage(userId: userId);
            },
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.play_arrow),
          width10,
          Text('Start Puzzle Mode'.hardcoded),
        ],
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: _bottomNavBarBgColor,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_back_ios_new),
          label: 'Back',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_forward_ios),
          label: 'Forward',
        ),
      ],
      onTap: (value) {
        if (value == 0) {
          _controller.previousMove();
        } else if (value == 1) {
          _controller.nextMove();
        }
      },
    );
  }
  //#endregion

  //#region Listeners
  void _topBarListener(BuildContext context, PuzzleModeState state) {
    state.maybeWhen(
      // Callback for the user move
      pieceMoved: (move) async {
        if (_puzzleCompleted(move.uci)) return;
        // validate the move
        if (move.uci == _puzzle!.moves.first) {
          // Right move: bot will peroform the next move
          await Future.delayed(const Duration(seconds: 1));
          String botMove = _puzzle!.moves.removeAt(0);
          _controller.autoPlayMove(botMove);
        } else {
          // Wrong move, undo the move and retry
          _retries++;
          await Future.delayed(const Duration(seconds: 1));
          _controller.undoMove();
        }
      },
      orElse: () {},
    );
  }

  void _boardListener(BuildContext context, PuzzleModeState state) {
    state.maybeWhen(
      pieceMoved: (move) {
        if (!_puzzleCompleted(move.uci)) return;

        _controller.setInteractable(false);

        // Save the puzzle as completed
        // This is done so we can calculate on the homepage if the
        // puzzle of the day is already compelted (hide it) or not,
        // or if a new puzzle is available
        secure_storage_helper.saveDailyPuzzle(DateTime.now());
      },
      orElse: () {},
    );
  }
  //#endregion
}
