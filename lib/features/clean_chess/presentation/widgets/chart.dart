import 'dart:math';

import 'package:cleanchess/core/utilities/extentions.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/profilepage_mode_items.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart' as lichess;

int elo = 1300;
int resultElo = 40; //How much elo the user gained/lost in a month
int topELo = 2000; //The highest elo the user had this month
int lowELo = 800; //The lowest elo the user had this month

int startDay = 1; //The day the user started playing this month
int endDay = 30; //The day the user stopped playing this month

class Chart extends StatelessWidget {
  const Chart({
    super.key,
    required this.mode,
    required this.history,
  });

  final GameMode mode;
  final lichess.RatingHistory history;

  Color get color => mode.color;

  List<Color> get gradientColors => [
        color.withOpacity(0.6),
        color.withOpacity(0.2),
      ];

  List<FlSpot> get spots {
    // history.point is a list of numbers:
    // [year, month, day, elo] month is 0-indexed (January is 0)

    final lastMonthPoints = history.points!
        .where((e) =>
            e.first == DateTime.now().year && e[1] == DateTime.now().month - 1)
        .toList();

    if (lastMonthPoints.isEmpty) {
      topELo = 0;
      lowELo = 0;
      resultElo = 0;
      startDay = 1;
      endDay = DateTime.now().day;
      return [];
    }

    topELo = lastMonthPoints.map((e) => e.last).reduce(max);
    lowELo = lastMonthPoints.map((e) => e.last).reduce(min);
    resultElo = topELo - lowELo;

    startDay = lastMonthPoints.first[2];
    endDay = lastMonthPoints.last[2];
    return lastMonthPoints
        .map((e) => FlSpot(e[2].toDouble(), e.last.toDouble()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          child: Column(
            children: [
              Container(
                height: 200,
                margin: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          topELo.toString(),
                          style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.fontSize,
                          ),
                        ),
                        Text(
                          lowELo.toString(),
                          style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.fontSize,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: LineChart(
                        _mainData(),
                      ),
                    ),
                  ],
                ),
              ),
              _bottomTitleWidgets(context),
            ],
          ),
        ),
      ),
    );
  }

  LineChartData _mainData() {
    return LineChartData(
      gridData: FlGridData(
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.white.withOpacity(0.1),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.white.withOpacity(0.1),
            strokeWidth: 1,
          );
        },
      ),

      titlesData: FlTitlesData(
        show: false,
      ),

      borderData: FlBorderData(
        show: false,
      ),

      //The X axis corresponds to the date, the Y axis to the elo
      minX: startDay.toDouble(),
      maxX: endDay.toDouble(),
      minY: lowELo.toDouble(),
      maxY: topELo.toDouble(),

      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.grey.shade800,
        ),
        handleBuiltInTouches: true,
      ),

      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          gradient: LinearGradient(
            colors: [color, color],
          ),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors,
              stops: const [0.1, 0.9],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }

  Widget _bottomTitleWidgets(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$startDay ${DateTime.now().monthName}",
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
            ),
          ),
          Text(
            "$endDay ${DateTime.now().monthName}",
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
            ),
          ), //TODO date
        ],
      ),
    );
  }
}
