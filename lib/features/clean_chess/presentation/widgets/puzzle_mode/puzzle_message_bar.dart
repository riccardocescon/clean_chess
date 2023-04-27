import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/in_game/puzzle_mode_cubit.dart';
import 'package:dartchess/dartchess.dart';
import 'package:flutter/material.dart';

class PuzzleMessageBarBuilder extends StatelessWidget {
  const PuzzleMessageBarBuilder({
    super.key,
    required this.context,
    required this.state,
    required this.onGetHintCount,
    required this.onGetRetriesCount,
    required this.onGetNextMove,
    required this.onNextMoveValidated,
    required this.isPuzzleCompleted,
  });

  final BuildContext context;
  final PuzzleModeState state;
  final int Function() onGetHintCount;
  final int Function() onGetRetriesCount;
  final String Function() onGetNextMove;
  final void Function() onNextMoveValidated;
  final bool Function(String) isPuzzleCompleted;

  @override
  Widget build(BuildContext context) {
    return state.maybeMap(
      turnOf: (value) => _PuzzleMessageBar(
        // invert the output because the first move is the bot one
        barType: value.side == Side.black ? TopBarType.white : TopBarType.black,
      ),
      pieceMoved: (value) {
        if (isPuzzleCompleted(value.move.uci)) {
          return _PuzzleMessageBar(
            barType: onGetHintCount() > 0
                ? TopBarType.solvedWithHints
                : onGetRetriesCount() == 0
                    ? TopBarType.solvedWithoutHints
                    : TopBarType.solvedInMultipleTries,
          );
        }

        // Validate move and show the right message
        if (value.move.uci == onGetNextMove()) {
          onNextMoveValidated();
          return const _PuzzleMessageBar(barType: TopBarType.rightMove);
        } else {
          return const _PuzzleMessageBar(barType: TopBarType.wrongMove);
        }
      },
      orElse: () => const SizedBox.shrink(),
    );
  }
}

class _PuzzleMessageBar extends StatelessWidget {
  const _PuzzleMessageBar({
    super.key,
    required this.barType,
    this.topBarHeight = 60,
  });

  final TopBarType barType;
  final double topBarHeight;

  @override
  Widget build(BuildContext context) {
    final messages = {
      TopBarType.white: 'White to play',
      TopBarType.black: 'Black to play',
      TopBarType.rightMove: 'Right move, keep going!',
      TopBarType.wrongMove: 'Wrong move, try again!',
      TopBarType.solvedWithoutHints: 'Solved without hints!',
      TopBarType.solvedWithHints: 'Solved with hints!',
      TopBarType.solvedInMultipleTries: 'Solved in multiple tries!',
    };
    final message = messages[barType]!;

    const noIcon = Icons.abc;
    final icons = {
      TopBarType.solvedWithoutHints: Icons.check_rounded,
      TopBarType.solvedWithHints: Icons.horizontal_rule_rounded,
      TopBarType.solvedInMultipleTries: Icons.close_rounded,
      TopBarType.white: noIcon,
      TopBarType.black: noIcon,
    };

    final icon = icons[barType];

    return Container(
      height: topBarHeight,
      color: barType.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Container(
              width: Theme.of(context).textTheme.bodyMedium!.fontSize,
              height: Theme.of(context).textTheme.bodyMedium!.fontSize,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: barType.secondaryColor,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.center,
              child: icon == noIcon
                  ? null
                  : Icon(
                      icon,
                      color: barType.secondaryColor,
                      size: Theme.of(context).textTheme.bodySmall!.fontSize,
                    ),
            ),
          width10,
          Text(
            message,
            style: TextStyle(
              color: barType.secondaryColor,
              fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
            ),
          ),
        ],
      ),
    );
  }
}

// Colors
const _topBarWhiteColor = Colors.white;
const _topBarBlackColor = Color.fromARGB(255, 33, 33, 33);
const _topBarGreenColor = Colors.green;
const _topBarRedColor = Colors.red;
const _topBarGrayColor = Colors.grey;

enum TopBarType {
  white(_topBarWhiteColor, _topBarBlackColor),
  black(_topBarBlackColor, _topBarWhiteColor),
  rightMove(_topBarGreenColor, _topBarWhiteColor),
  wrongMove(_topBarRedColor, _topBarWhiteColor),
  solvedWithoutHints(_topBarGreenColor, _topBarWhiteColor),
  solvedWithHints(_topBarGrayColor, _topBarWhiteColor),
  solvedInMultipleTries(_topBarGrayColor, _topBarWhiteColor);

  const TopBarType(
    this.primaryColor,
    this.secondaryColor,
  );

  final Color primaryColor;
  final Color secondaryColor;
}
