import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PuzzleBottomGraph extends StatelessWidget {
  const PuzzleBottomGraph({
    super.key,
    required this.minElo,
    required this.maxElo,
    required this.ratings,
    this.backgroundColor = const Color.fromARGB(255, 33, 33, 33),
    this.positiveColor = Colors.green,
    this.negativeColor = Colors.pink,
    this.linesColor = Colors.grey,
  });

  final double minElo;
  final double maxElo;
  final List<int> ratings;
  final Color backgroundColor;
  final Color positiveColor;
  final Color negativeColor;
  final Color linesColor;

  @override
  Widget build(BuildContext context) {
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
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.symmetric(
            horizontal: BorderSide(color: backgroundColor),
          ),
        ),
        extraLinesData: ExtraLinesData(
          horizontalLines: [
            ...List.generate(
              5,
              (index) => HorizontalLine(
                y: minElo + (maxElo - minElo) / 5 * index,
                color: linesColor,
                strokeWidth: 1,
              ),
            ),
          ],
        ),
        lineBarsData: ratings.isEmpty
            ? []
            : [
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
                        color = backgroundColor;
                      } else {
                        if (ratings[p0.x.toInt()] > ratings[p0.x.toInt() - 1]) {
                          color = positiveColor;
                        } else {
                          color = negativeColor;
                        }
                      }
                      return FlDotCirclePainter(
                        radius: 3,
                        color: color,
                      );
                    },
                  ),
                  spots: List.generate(
                    ratings.length,
                    (index) => FlSpot(
                      index.toDouble(),
                      ratings[index].toDouble(),
                    ),
                  ),
                ),
              ],
      ),
    );
  }
}
