import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _chart(),
        ],
      ),
    );
  }
}

Widget _chart() {
  return Container(
    padding: const EdgeInsets.all(10),
    width: double.infinity,
    height: 150,
    child: LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
              isCurved: true,
              color: Colors.pink,
              barWidth: 2,
              dotData: FlDotData(show: false),
              spots: [
                const FlSpot(0, 1),
                const FlSpot(1, 3),
                const FlSpot(2, 10),
                const FlSpot(3, 7),
                const FlSpot(4, 12),
                const FlSpot(5, 13),
                const FlSpot(6, 17),
                const FlSpot(7, 15),
                const FlSpot(8, 12)
              ]),
        ],
        borderData: FlBorderData(show: false),
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(show: false),
      ),
    ),
  );
}
