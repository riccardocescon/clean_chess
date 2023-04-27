import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:cleanchess/core/utilities/debug.dart';
import 'package:cleanchess/core/utilities/extentions.dart';
import 'package:cleanchess/features/clean_chess/data/models/puzzle_model.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/in_game/puzzle_mode_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/timer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../blocs/user_cubit.dart';

class PuzzleTopStats extends StatelessWidget {
  const PuzzleTopStats({
    super.key,
    required this.timerController,
    required this.onGetPuzzle,
    required this.isPuzzleCompleted,
    this.topStatsHeigth = 50,
    this.topStatsPadding = 10,
    this.textColor = Colors.white,
    this.linkColor = Colors.blue,
  });

  final TimerController timerController;
  final PuzzleModel Function() onGetPuzzle;
  final bool Function(String uci) isPuzzleCompleted;
  final double topStatsHeigth;
  final double topStatsPadding;
  final Color textColor;
  final Color linkColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PuzzleModeCubit, PuzzleModeState>(
        builder: (context, state) {
      return state.maybeMap(
        pieceMoved: (value) {
          if (isPuzzleCompleted(value.move.uci)) {
            return _topPuzzleStats(context);
          } else {
            return _topStats();
          }
        },
        orElse: () => _topStats(),
      );
    });
  }

  Widget _topStats() {
    return Container(
      height: topStatsHeigth,
      padding: EdgeInsets.symmetric(horizontal: topStatsPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _updatedRatingText(),
          Row(
            children: [
              const Icon(Icons.access_alarms_rounded),
              width5,
              TimerWidget(
                timerController: timerController,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _topPuzzleStats(BuildContext context) {
    final puzzle = onGetPuzzle();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: topStatsPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LichessPuzzle #${puzzle.puzzleId}'.hardcoded,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: textColor,
                    fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
                  ),
                ),
                heigth5,
                Text(
                  'Rating: ${puzzle.rating}'.hardcoded,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                    color: textColor,
                  ),
                ),
                heigth5,
                Text(
                  'Tags: ${puzzle.themes}'.hardcoded,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.labelSmall!.fontSize,
                    color: textColor,
                  ),
                ),
                heigth5,
                GestureDetector(
                  onTap: () {
                    logDebug('Watch this match');
                    final url = Uri.parse(puzzle.gameUrl);
                    launchUrl(url);
                  },
                  child: Text(
                    'Watch this match'.hardcoded,
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.labelSmall!.fontSize,
                      color: linkColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _updatedRatingText(),

                //TODO: Enable puzzle rating deviation when
                // ranking puzzle will be implemented
                // Icon(
                //   Icons.arrow_drop_up_rounded,
                //   color: textColor,
                // ),
                // Text(
                //   '10'.hardcoded,
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     color: textColor,
                //   ),
                //   textAlign: TextAlign.center,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _updatedRatingText() {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return state.maybeMap(
          publicData: (value) {
            return Text(
              'Your Rating\n${value.user.perfs?.puzzle?.rating ?? "0"}'
                  .hardcoded,
              textAlign: TextAlign.center,
            );
          },
          orElse: () => const CircularProgressIndicator(strokeWidth: 1),
        );
      },
    );
  }
}
