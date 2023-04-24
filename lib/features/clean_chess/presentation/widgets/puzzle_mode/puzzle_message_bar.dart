import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:flutter/material.dart';

class PuzzleMessageBar extends StatelessWidget {
  const PuzzleMessageBar({
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
