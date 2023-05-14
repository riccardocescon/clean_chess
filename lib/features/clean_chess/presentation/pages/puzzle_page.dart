import 'package:cleanchess/core/clean_chess/utilities/snackbar.dart';
import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:cleanchess/features/clean_chess/data/models/puzzle_model.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/in_game/puzzle_mode_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/user_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/chessboard_interpreter.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/dialogs/pawn_promotion_dialog.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/puzzle_mode/puzzle_bottom_graph.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/puzzle_mode/puzzle_hint_button.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/puzzle_mode/puzzle_top_stats.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/timer_widget.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/titled_app_bar.dart';
import 'package:cleanchess/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletons/skeletons.dart';

import '../widgets/puzzle_mode/puzzle_message_bar.dart';

class PuzzlePage extends StatefulWidget {
  const PuzzlePage({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  State<PuzzlePage> createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {
  //Colors
  final Color _bottomNavBarBgColor = Colors.grey.shade900;
  final Color _winColor = Colors.green;
  final Color _barColor = Colors.white;
  final Color _loseColor = Colors.red;

  // Sizes
  final double _bottomBarHeigth = 50;
  final double _bottomBarCompletedHeigth = 100;

  PuzzleModel? _puzzle;
  bool _puzzleCompleted(String lastMove) =>
      _puzzle!.moves.length == 1 && lastMove == _puzzle!.moves.first;
  final PuzzleController _controller = PuzzleController();
  final TimerController _timerController = TimerController();
  int _retries = 0;
  int _hintCount = 0;
  // _HintMove _hintMove = _HintMove.highlight;

  final List<_PuzzleStreakData> _streak = [];

  @override
  void initState() {
    // Able to call 2 events at the same time
    // because [PuzzleModelCubit] is a Local Cubit, no web calls
    _requestPuzzleRating();
    sl<PuzzleModeCubit>().getRandomPuzzle();
    super.initState();
  }

  // Times
  final Duration _bottomBarAnimation = const Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: _body(),
      title: 'LichessPuzzle',
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        BlocConsumer<PuzzleModeCubit, PuzzleModeState>(
          listener: _topBarListener,
          builder: _topBarBuilder,
        ),
        BlocProvider.value(
          value: BlocProvider.of<UserCubit>(context),
          child: PuzzleTopStats(
            onGetPuzzle: () => _puzzle!,
            isPuzzleCompleted: (uci) => _puzzleCompleted(uci),
            timerController: _timerController,
          ),
        ),
        Expanded(
          child: Center(
            child: BlocConsumer<PuzzleModeCubit, PuzzleModeState>(
              listener: _chessboardListener,
              builder: _chessboardBuilder,
            ),
          ),
        ),
        BlocBuilder<PuzzleModeCubit, PuzzleModeState>(
          builder: (context, state) {
            return state.maybeWhen(
              pieceMoved: (move) => _bottomBar(_puzzleCompleted(move.uci)),
              orElse: () => _bottomBar(false),
            );
          },
        ),
      ],
    );
  }

  Widget _chessInterpreter() {
    return ChessboardInterpreter(
      controller: _controller,
      onPromotion: (turn) => showPromotionDialog(context, turn),
    );
  }

  Widget _bottomBar(bool puzzleCompleted) {
    return AnimatedContainer(
      duration: _bottomBarAnimation,
      curve: Curves.easeInOut,
      height: puzzleCompleted ? _bottomBarCompletedHeigth : _bottomBarHeigth,
      color: _bottomNavBarBgColor,
      child: Center(
        child: AnimatedCrossFade(
          duration: _bottomBarAnimation,
          crossFadeState: puzzleCompleted
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: PuzzleHintButton(
            onHintPressed: () => _hintCount++,
            onGetNextMove: () => _puzzle!.moves.first,
            onGetHintCell: (move) => _controller.highLightHintCell(move),
            onForceUserMove: (move) => _controller.forceUserMove(move),
          ),
          secondChild: _bottomBarGraph(),
        ),
      ),
    );
  }

  Widget _bottomBarGraph() {
    return SizedBox(
      height: _bottomBarCompletedHeigth,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _bottomBarGraphSolvedText(),
            heigth5,
            Expanded(
              child: _bottomBarChart(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomBarGraphSolvedText() {
    return SizedBox(
      height: Theme.of(context).textTheme.titleLarge!.fontSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text('Solved ${_streak.length} puzzles in a Row'),
          Align(
            alignment: Alignment.topRight,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${_streak.where((element) => element.win).length}w',
                    style: TextStyle(
                      color: _winColor,
                    ),
                  ),
                  TextSpan(
                    text: ' / ',
                    style: TextStyle(
                      color: _barColor,
                    ),
                  ),
                  TextSpan(
                    text: '${_streak.where((element) => !element.win).length}l',
                    style: TextStyle(
                      color: _loseColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomBarChart() {
    final sorted = _streak.toList();
    sorted.sort((a, b) => a.elo < b.elo ? 1 : -1);
    double minElo = sorted.isEmpty ? 0 : sorted.last.elo;
    double maxElo = sorted.isEmpty ? 0 : sorted.first.elo;
    final List<int> puzzlePlayed =
        List.generate(_streak.length, (index) => _streak[index].elo.toInt());
    return PuzzleBottomGraph(
      minElo: minElo,
      maxElo: maxElo,
      ratings: puzzlePlayed,
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
          icon: Icon(Icons.shuffle),
          label: 'Shuffle',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.share),
          label: 'Share',
        ),
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
          setState(() {
            _retries = 0;
            _hintCount = 0;
            sl<PuzzleModeCubit>().getRandomPuzzle();
          });
        } else if (value == 1) {
          //TODO: get puzzle info from api based on id, maybe on init state
          // and share the link for this puzzle. DO NOT SHARE the game, that is
          // on the watch game at the end. Web API are needed!
          showSnackbar(
            context: context,
            message: 'Coming soon...',
            backgroundColor: Colors.amber.shade700,
          );
        } else if (value == 2) {
          _controller.previousMove();
        } else if (value == 3) {
          _controller.nextMove();
        }
      },
    );
  }

  void _requestPuzzleRating() {
    sl<UserCubit>().getPublicData(userId: widget.userId);
  }

  //#region Builders
  Widget _topBarBuilder(BuildContext context, PuzzleModeState state) {
    return PuzzleMessageBarBuilder(
      context: context,
      state: state,
      onGetHintCount: () => _hintCount,
      onGetRetriesCount: () => _retries,
      onGetNextMove: () => _puzzle!.moves.first,
      onNextMoveValidated: () => _puzzle!.moves.removeAt(0),
      isPuzzleCompleted: _puzzleCompleted,
    );
  }

  Widget _chessboardBuilder(BuildContext context, PuzzleModeState state) {
    return state.maybeMap(
      initial: (_) => SkeletonItem(
        child: Container(),
      ),
      loading: (_) => SkeletonItem(
        child: Container(),
      ),
      orElse: () => _chessInterpreter(),
    );
  }
  //#endregion Builders

  //#region Listeners
  void _topBarListener(BuildContext context, PuzzleModeState state) {
    state.maybeWhen(
      // Callback for a puzzle just loaded
      turnOf: (side) async {
        final userSide = side.opposite;
        _controller.setBoardSide(userSide);

        await Future.delayed(const Duration(seconds: 1));
        final botMove = _puzzle!.moves.removeAt(0);
        _controller.autoPlayMove(botMove);
        _timerController.restart();
      },
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

  void _chessboardListener(BuildContext context, PuzzleModeState state) {
    state.maybeWhen(
      // Callback for a puzzle just loaded
      puzzleLoaded: (puzzle) {
        _puzzle = puzzle;
        _controller.loadFen(puzzle.fen);
      },
      pieceMoved: (move) {
        if (_puzzleCompleted(move.uci)) {
          _timerController.stop();
          _controller.setInteractable(false);
          _streak.add(
            _PuzzleStreakData(
                _puzzle!.rating.toDouble(), _retries == 0 && _hintCount < 2),
          );
        }
      },
      orElse: () {},
    );
  }
  //#endregion
}

class _PuzzleStreakData {
  final double elo;
  final bool win;

  _PuzzleStreakData(this.elo, this.win);
}
