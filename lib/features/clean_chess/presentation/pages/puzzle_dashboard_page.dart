import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:cleanchess/core/utilities/extentions.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/puzzle_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/loading_skeleton.dart';
import 'package:cleanchess/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<Tuple2<String, Color>> _statNames = [
  Tuple2('Openings'.hardcoded, Colors.lightBlue),
  Tuple2('Double Attack'.hardcoded, Colors.brown),
  Tuple2('King Side Attack'.hardcoded, Colors.indigo),
  Tuple2('Ending'.hardcoded, Colors.purple),
  Tuple2('Rook Endgame'.hardcoded, Colors.grey),
  Tuple2('Pin'.hardcoded, Colors.red),
  Tuple2('Middle Game'.hardcoded, Colors.pink),
  Tuple2('Advanced Pawn'.hardcoded, Colors.green),
  Tuple2('Traps'.hardcoded, Colors.amber),
];

class PuzzleDashboardPage extends StatelessWidget {
  const PuzzleDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    sl<PuzzleCubit>().getPuzzleDashboard();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Puzzle'),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _paddedItems(child: _topStats()),
        ),
        SliverToBoxAdapter(
          child: _paddedItems(child: _chart(context)),
        ),
        SliverToBoxAdapter(
          child: _paddedItems(
            child: Column(
              children: _statNames
                  .map(
                    (e) => _statsRow(
                      title: e.value1,
                      value: '9999',
                      color: e.value2,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _statsRow({
    required String title,
    required String value,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color,
            maxRadius: 5,
          ),
          width10,
          Text(title),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(value),
            ),
          ),
        ],
      ),
    );
  }

  Widget _paddedItems({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: child,
    );
  }

  Widget _topStats() {
    return BlocBuilder<PuzzleCubit, PuzzleState>(
      builder: (context, state) {
        return state.maybeMap(
          puzzleDashboard: (value) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _topStat('Played'.hardcoded, '9999'),
                _topStat('Performance'.hardcoded, '9999'),
                _topStat('Solved'.hardcoded, '9999'),
              ],
            );
          },
          orElse: () {
            return const LoadingSkeleton(double.maxFinite, 50);
          },
        );
      },
    );
  }

  Widget _topStat(String title, String value) {
    return Column(
      children: [
        Text(title),
        Text(value),
      ],
    );
  }

  Widget _chart(BuildContext context) {
    return SizedBox(
      width: 1000,
      height: 500,
      child: RadarChart(
        RadarChartData(
          dataSets: showingDataSets(),
          radarBackgroundColor: Colors.transparent,
          borderData: FlBorderData(show: false),
          radarBorderData: const BorderSide(color: Colors.grey),
          gridBorderData: const BorderSide(color: Colors.grey),
          titlePositionPercentageOffset: 0.2,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
          ),
          getTitle: (index, angle) {
            final titles = Map.fromEntries(
              List.generate(
                _statNames.length,
                (index) => MapEntry(
                  index,
                  _statNames[index].value1.replaceLast(from: ' ', to: '\n'),
                ),
              ),
            );

            return RadarChartTitle(
              text: titles[index] ?? '',
              positionPercentageOffset: 0.1,
            );
          },
          tickCount: 5,
          ticksTextStyle: const TextStyle(color: Colors.white, fontSize: 8),
          tickBorderData: const BorderSide(color: Colors.grey),
          radarShape: RadarShape.polygon,
        ),
        swapAnimationDuration: const Duration(milliseconds: 400),
      ),
    );
  }

  List<RadarDataSet> showingDataSets() {
    return rawDataSets().asMap().entries.map((entry) {
      final index = entry.key;
      final rawDataSet = entry.value;

      final isGhost = index == 0;

      return RadarDataSet(
        fillColor:
            isGhost ? Colors.transparent : rawDataSet.color.withOpacity(0.2),
        borderColor: isGhost ? Colors.transparent : rawDataSet.color,
        entryRadius: 3,
        dataEntries:
            rawDataSet.values.map((e) => RadarEntry(value: e)).toList(),
        borderWidth: 2,
      );
    }).toList();
  }

  List<RawDataSet> rawDataSets() {
    return [
      // This Ghost RawDataSet is used to show the background of the chart
      // This is a Workaround for the fl_chart library
      // because there is no way to set the minimum - maximum value of the chart
      // This holds the min and max values [0 - 2000]
      RawDataSet(
        title: 'Ghost',
        color: Colors.transparent,
        values: [
          0,
          1000,
          1200,
          1400,
          1600,
          1800,
          1800,
          1800,
          2000,
        ],
      ),
      RawDataSet(
        title: 'Puzzle',
        color: Colors.pink,
        values: [
          1850,
          1800,
          1000,
          1800,
          2000,
          1000,
          1300,
          1900,
          1600,
        ],
      ),
    ];
  }
}

class RawDataSet {
  RawDataSet({
    required this.title,
    required this.color,
    required this.values,
  });

  final String title;
  final Color color;
  final List<double> values;
}
