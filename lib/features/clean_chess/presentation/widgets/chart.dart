import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

int elo = 1300;
int resultElo = 40; //How much elo the user gained/lost in a month
int topELo = 2000; //The highest elo the user had this month
int lowELo = 800; //The lowest elo the user had this month

List<Color> gradientColors = [
  resultElo < 0 ? Colors.pink : Colors.green,
  resultElo < 0 ? Colors.pink : Colors.green,
];

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          child: SizedBox(height: 200, child: LineChart(_mainData())),
        ),
      ),
    );
  }

  LineChartData _mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
      ),

      titlesData: FlTitlesData(
        show: false,
      ),

      borderData: FlBorderData(
        show: true,
      ),
      //The X axis corresponds to the date, the Y axis to the elo
      minX: 0,
      maxX: 30,
      minY: lowELo.toDouble(),
      maxY: topELo.toDouble(),

      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 800),
            FlSpot(3, 1200),
            FlSpot(6, 1300),
            FlSpot(9, 1200),
            FlSpot(12, 1200),
            FlSpot(15, 1500),
            FlSpot(18, 1800),
            FlSpot(21, 1200),
            FlSpot(24, 1000),
            FlSpot(27, 1600),
            FlSpot(30, 1700),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
