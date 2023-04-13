import 'dart:math';

import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:cleanchess/core/utilities/extentions.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/chessboard_interpreter.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/titled_app_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PuzzlePage extends StatefulWidget {
  const PuzzlePage({super.key});

  @override
  State<PuzzlePage> createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {
  List<String> _moves = [];

  //Colors
  final Color _bottomNavBarBgColor = Colors.grey.shade900;

  // Sizes
  final double _topBarHeight = 60;
  final double _bottomBarHeigth = 50;
  final double _bottomBarCompletedHeigth = 100;
  final double _topStatsHeigth = 50;
  final double _topStatsPadding = 10;

  // Times
  final Duration _bottomBarAnimation = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: _body(),
      title: 'Puzzle',
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        _topBar(_TopBarType.white),
        _topStats(),
        const Expanded(
          child: Center(
            child: ChessboardInterpreter(),
          ),
        ),
        _bottomBar(false),
      ],
    );
  }

  Widget _topBar(_TopBarType barType) {
    final messages = {
      _TopBarType.white: 'White to play',
      _TopBarType.black: 'Black to play',
      _TopBarType.rightMove: 'Right move, keep going!',
      _TopBarType.wrongMove: 'Wrong move, try again!',
      _TopBarType.solvedWithoutHints: 'Solved without hints!',
      _TopBarType.solvedWithHints: 'Solved with hints!',
      _TopBarType.solvedInMultipleTries: 'Solved in multiple tries!',
    };
    final message = messages[barType]!;

    const noIcon = Icons.abc;
    final icons = {
      _TopBarType.solvedWithoutHints: Icons.check_rounded,
      _TopBarType.solvedWithHints: Icons.horizontal_rule_rounded,
      _TopBarType.solvedInMultipleTries: Icons.close_rounded,
      _TopBarType.white: noIcon,
      _TopBarType.black: noIcon,
    };

    final icon = icons[barType];

    return Container(
      height: _topBarHeight,
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

  Widget _topStats() {
    return Container(
      height: _topStatsHeigth,
      padding: EdgeInsets.symmetric(horizontal: _topStatsPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Your Rating\n1500'.hardcoded,
            textAlign: TextAlign.center,
          ),
          Row(
            children: const [
              Icon(Icons.access_alarms_rounded),
              width5,
              Text('3:12', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bottomBar(bool puzzleCompleted) {
    return AnimatedContainer(
      duration: _bottomBarAnimation,
      height: puzzleCompleted ? _bottomBarCompletedHeigth : _bottomBarHeigth,
      color: _bottomNavBarBgColor,
      child: Center(
        child: AnimatedCrossFade(
          duration: _bottomBarAnimation,
          crossFadeState: puzzleCompleted
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: _bottomBarShowNextMove(),
          secondChild: _bottomBarGraph(),
        ),
      ),
    );
  }

  Widget _bottomBarShowNextMove() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.tips_and_updates_rounded,
        ),
        width10,
        Text('Show next move'.hardcoded),
      ],
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
          const Text('Solved 6 puzzles in a Row'),
          Align(
            alignment: Alignment.topRight,
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: '4w',
                    style: TextStyle(
                      color: _topBarGreenColor,
                    ),
                  ),
                  TextSpan(
                    text: ' / ',
                    style: TextStyle(
                      color: _topBarWhiteColor,
                    ),
                  ),
                  TextSpan(
                    text: '3l',
                    style: TextStyle(
                      color: _topBarRedColor,
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
    const double minElo = 1500;
    const double maxElo = 2000;
    final List<int> puzzlePlayed =
        List.generate(12, (index) => Random().nextInt(200) + 1600);
    return LineChart(
      LineChartData(
        minY: minElo,
        maxY: maxElo,
        minX: 0,
        maxX: 20,
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            axisNameSize: 0,
          ),
          topTitles: AxisTitles(
            axisNameSize: 0,
          ),
          rightTitles: AxisTitles(
            axisNameSize: 0,
          ),
        ),
        gridData: FlGridData(
          drawVerticalLine: false,
          drawHorizontalLine: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.red,
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: const Border.symmetric(
            horizontal: BorderSide(color: _topBarGrayColor),
          ),
        ),
        extraLinesData: ExtraLinesData(
          horizontalLines: [
            ...List.generate(
              5,
              (index) => HorizontalLine(
                y: minElo + (maxElo - minElo) / 5 * index,
                color: _topBarGrayColor,
                strokeWidth: 1,
              ),
            ),
          ],
        ),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            barWidth: 2,
            color: Colors.green,
            belowBarData: BarAreaData(
              show: true,
              color: Colors.green.withOpacity(0.2),
            ),
            dotData: FlDotData(
              show: true,
              getDotPainter: (p0, p1, p2, p3) {
                late Color color;
                if (p0.x == 0) {
                  color = _topBarGrayColor;
                } else {
                  if (puzzlePlayed[p0.x.toInt()] >
                      puzzlePlayed[p0.x.toInt() - 1]) {
                    color = _topBarGreenColor;
                  } else {
                    color = _topBarRedColor;
                  }
                }
                return FlDotCirclePainter(
                  radius: 3,
                  color: color,
                );
              },
            ),
            spots: List.generate(
              puzzlePlayed.length,
              (index) => FlSpot(
                index.toDouble(),
                puzzlePlayed[index].toDouble(),
              ),
            ),
          ),
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
    );
  }
}

// Colors
const _topBarWhiteColor = Colors.white;
const _topBarBlackColor = Color.fromARGB(255, 33, 33, 33);
const _topBarGreenColor = Colors.green;
const _topBarRedColor = Colors.red;
const _topBarGrayColor = Colors.grey;

enum _TopBarType {
  white(_topBarWhiteColor, _topBarBlackColor),
  black(_topBarBlackColor, _topBarWhiteColor),
  rightMove(_topBarGreenColor, _topBarWhiteColor),
  wrongMove(_topBarRedColor, _topBarWhiteColor),
  solvedWithoutHints(_topBarGreenColor, _topBarWhiteColor),
  solvedWithHints(_topBarGrayColor, _topBarWhiteColor),
  solvedInMultipleTries(_topBarGrayColor, _topBarWhiteColor);

  const _TopBarType(
    this.primaryColor,
    this.secondaryColor,
  );

  final Color primaryColor;
  final Color secondaryColor;
}
