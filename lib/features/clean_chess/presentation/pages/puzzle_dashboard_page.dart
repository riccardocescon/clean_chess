import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:cleanchess/core/utilities/extentions.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/puzzle_cubit.dart';
import 'package:cleanchess/injection_container.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart' as lichess;
import 'package:skeletons/skeletons.dart';

final List<_SupportedPuzzleStats> _stats = [
  _SupportedPuzzleStats.opening,
  _SupportedPuzzleStats.middlegame,
  _SupportedPuzzleStats.endgame,
  _SupportedPuzzleStats.fork,
  _SupportedPuzzleStats.mate,
  _SupportedPuzzleStats.sacrifice,
  _SupportedPuzzleStats.kingsideAttack,
  _SupportedPuzzleStats.discoveredAttack,
  _SupportedPuzzleStats.interference,
  _SupportedPuzzleStats.defensiveMove,
  _SupportedPuzzleStats.attraction,
  _SupportedPuzzleStats.exposedKing,
  _SupportedPuzzleStats.deflection,
  _SupportedPuzzleStats.intermezzo,
  _SupportedPuzzleStats.zugzwang,
  _SupportedPuzzleStats.trappedPiece,
  _SupportedPuzzleStats.capturingDefender,
];

class PuzzleDashboardPage extends StatelessWidget {
  const PuzzleDashboardPage({super.key});

  final _loadingSkeletonListViewHeigth = 300.0;
  final _statsColoredCircleRadius = 5.0;
  final _pagePadding = const EdgeInsets.symmetric(horizontal: 30, vertical: 10);
  final _chartAspectRatio = 1.0;
  final _chartDotSize = 4.0;
  final _chartBorderWidth = 2.0;

  @override
  Widget build(BuildContext context) {
    sl<PuzzleCubit>().getPuzzleDashboard();
    return Scaffold(
      appBar: AppBar(
        title: const Text('LichessPuzzle'),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _chart(context),
        _statsListView(),
      ],
    );
  }

  //#region Chart
  Widget _chart(BuildContext context) {
    return SliverToBoxAdapter(
      child: _paddedItems(
        child: AspectRatio(
          aspectRatio: _chartAspectRatio,
          child: BlocBuilder<PuzzleCubit, PuzzleState>(
            builder: (context, state) {
              return state.maybeWhen(
                puzzleDashboard: (dashboard) {
                  return RadarChart(
                    RadarChartData(
                      radarTouchData: RadarTouchData(
                        enabled: true,
                        touchCallback: (touchEvent, touchResponse) {},
                      ),
                      dataSets: showingDataSets(dashboard),
                      radarBackgroundColor: Colors.transparent,
                      borderData: FlBorderData(show: false),
                      radarBorderData: const BorderSide(color: Colors.grey),
                      gridBorderData: const BorderSide(color: Colors.grey),
                      titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize:
                            Theme.of(context).textTheme.bodySmall?.fontSize,
                      ),
                      getTitle: (index, angle) {
                        final titles = Map.fromEntries(
                          List.generate(
                            _stats.length,
                            (index) => MapEntry(
                              index,
                              _stats[index]
                                  .appName
                                  .replaceLast(from: ' ', to: '\n'),
                            ),
                          ),
                        );

                        return RadarChartTitle(
                          text: titles[index] ?? '',
                          positionPercentageOffset: 0.1,
                        );
                      },
                      tickCount: 5,
                      ticksTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize:
                            Theme.of(context).textTheme.labelSmall?.fontSize,
                      ),
                      tickBorderData: const BorderSide(color: Colors.grey),
                      radarShape: RadarShape.polygon,
                    ),
                  );
                },
                orElse: () => const SkeletonAvatar(
                  style: SkeletonAvatarStyle(shape: BoxShape.circle),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  List<RadarDataSet> showingDataSets(lichess.LichessPuzzleDashboard dashboard) {
    return rawDataSets(dashboard).asMap().entries.map((entry) {
      final index = entry.key;
      final rawDataSet = entry.value;

      final isGhost = index == 0;

      return RadarDataSet(
        fillColor:
            isGhost ? Colors.transparent : rawDataSet.color.withOpacity(0.2),
        borderColor: isGhost ? Colors.transparent : rawDataSet.color,
        entryRadius: _chartDotSize,
        dataEntries:
            rawDataSet.values.map((e) => RadarEntry(value: e)).toList(),
        borderWidth: _chartBorderWidth,
      );
    }).toList();
  }

  List<RawDataSet> rawDataSets(lichess.LichessPuzzleDashboard dashboard) {
    return [
      // This Ghost RawDataSet is used to show the background of the chart
      // This is a Workaround for the fl_chart library
      // because there is no way to set the minimum - maximum value of the chart
      // This holds the min and max values [0 - 2000]
      RawDataSet(
        title: 'Ghost',
        color: Colors.transparent,
        values: [
          ...List.generate(_stats.length - 1, (index) => 0),
          2000,
        ],
      ),
      RawDataSet(
        title: 'LichessPuzzle',
        color: Colors.pink,
        values: _sortedPuzzleRatings(dashboard),
      ),
    ];
  }
  //#endregion Chart

  //#region Stats List View
  Widget _statsListView() {
    return SliverToBoxAdapter(
      child: BlocBuilder<PuzzleCubit, PuzzleState>(
        builder: (context, state) {
          return state.maybeMap(
            puzzleDashboard: (e) => _paddedItems(
              child: Column(
                children: _stats
                    .map(
                      (stat) => _statsRow(
                        context: context,
                        title: stat.appName,
                        value: _getRating(stat, e.dashboard).toString(),
                        color: stat.color,
                        name: stat.appName,
                        description: stat.description,
                      ),
                    )
                    .toList(),
              ),
            ),
            orElse: () => SizedBox(
              height: _loadingSkeletonListViewHeigth,
              child: SkeletonListView(),
            ),
          );
        },
      ),
    );
  }

  Widget _statsRow({
    required BuildContext context,
    required String title,
    required String value,
    required Color color,
    required String name,
    required String description,
  }) {
    return MaterialButton(
      onPressed: () => _showInfoDialog(context, name, description, color),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color,
            maxRadius: _statsColoredCircleRadius,
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
  //#endregion Stats List View

  //#region Helpers
  Widget _paddedItems({required Widget child}) {
    return Padding(
      padding: _pagePadding,
      child: child,
    );
  }

  int _getRating(
    _SupportedPuzzleStats stat,
    lichess.LichessPuzzleDashboard dashboard,
  ) {
    final refStat = dashboard.themes?[stat.lichessApiName];
    if (refStat == null) {
      return 0;
    }

    return refStat.results?.puzzleRatingAvg ?? 0;
  }

  List<double> _sortedPuzzleRatings(lichess.LichessPuzzleDashboard dashboard) {
    List<double> ratings = [];

    for (final currentStat in _stats) {
      ratings.add(_getRating(currentStat, dashboard).toDouble());
    }

    return ratings;
  }

  void _showInfoDialog(
    BuildContext context,
    String name,
    String description,
    Color color,
  ) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) => AlertDialog(
        title: Text(
          name,
          style: TextStyle(
            color: color,
            fontWeight: Theme.of(context).textTheme.titleLarge?.fontWeight,
          ),
        ),
        content: Text(description),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Close', style: TextStyle(color: color)),
          ),
        ],
      ),
    );
  }
  //#endregion Helpers
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

enum _SupportedPuzzleStats {
  endgame(
    'endgame',
    'Endgames',
    "The endgame is the stage of the game when few pieces are left on the board",
    Colors.purple,
  ),
  middlegame(
    'middlegame',
    'Middle Game',
    "The middlegame is the middle part of a chess game, after the opening and before the endgame",
    Colors.pink,
  ),
  fork(
    'fork',
    'Forks',
    " A fork is one of a basic chess tactic that consists of a single piece attacking two or more pieces at the same time. The attacking piece is known as the forking piece, while the attacked troops are known as the forked pieces",
    Colors.red,
  ),
  mate(
    'mate',
    'Mate',
    "When a king is attacked, it is called check. A checkmate (also known as 'mate') occurs when a king is placed in check and has no legal moves to escape. When a checkmate happens, the game ends immediately, and the player who delivered the checkmate wins",
    Colors.orange,
  ),
  sacrifice(
    'sacrifice',
    'Sacrifice',
    "A sacrifice happens in chess when one player intentionally gives up material to achieve a different or larger goal. Sacrifices are usually a part of a combination of moves that result in a better position or a more comfortable position for the player who performs it",
    Colors.yellow,
  ),
  opening(
    'opening',
    'Openings',
    "A chess opening is the group of initial moves of a chess game",
    Colors.lightBlue,
  ),
  kingsideAttack(
    'kingsideAttack',
    'King Side Attack',
    "The king side is the side of the chessboard that is closest to the king",
    Colors.indigo,
  ),
  discoveredAttack(
    'discoveredAttack',
    'Discovered Attack',
    "A discovered attack happens when a player moves one piece out of the way to reveal a previously blocked attack by another piece.",
    Colors.teal,
  ),
  interference(
    'interference',
    'Interference',
    "An interference (sometimes also called an 'obstruction') in chess occurs when a player interposes a piece between an enemy piece or critical square and its defender. As a result, the other player can no longer guard the attacked piece or square and usually faces a significant material loss or is checkmated.",
    Colors.brown,
  ),
  defensiveMove(
    'defensiveMove',
    'Defensive Move',
    "Defending in chess is the act of avoiding or protecting yourself against an undesirable outcome. Defensive moves can prevent the loss of material, protect the king against checks, and stop checkmates. They can also deter the opponent from gaining a strategic edge, like creating a passed pawn or dominating a key square",
    Colors.cyan,
  ),
  // rookEndgame(
  //   'rookEndgame',
  //   'Rook Endgame',
  //   "The rook endgame is a chess endgame in which only the rooks and kings remain on the board",
  //   Colors.grey,
  // ),
  attraction(
    'attraction',
    'Attraction',
    "Attraction is a tactical motif, typically involving a sacrifice that attracts an opposing piece, often the king, to a square where its new position can be exploited by a tactic favoring the attacker",
    Colors.deepPurple,
  ),
  // quietMove(
  //     'quietMove',
  //     'Quiet Move',
  //     "A quiet chess move doesn’t look particularly significant and may only change the structure of the position by a small margin",
  //     Colors.lime),
  intermezzo(
    'intermezzo',
    'Intermezzo',
    "An intermezzo is a chess move that ignores the opponent's threats and instead focuses on improving the player's own position. It is often a move that is not immediately obvious, but which is a good move in the long run",
    Colors.pinkAccent,
  ),
  exposedKing(
      'exposedKing',
      'Exposed King',
      "The Exposed King is a chess tactic in which the king is left undefended and vulnerable to attack. The king is usually exposed by a sacrifice of a piece or pawn, or by a move that leaves the king undefended",
      Colors.deepOrange),
  deflection(
    'deflection',
    'Deflection',
    "A deflection is a tactic that forces a piece away from a specific duty or square that is important. After the deflection is performed and the piece is forced away from the important square, another operation can be carried out that wasn't possible before",
    Colors.blue,
  ),
  zugzwang(
    'zugzwang',
    'Zugzwang',
    "The idea behind this term is that in certain positions, it would be beneficial for a player to skip their turn because moving any piece would result in an advantage for their opponent.",
    Colors.green,
  ),
  // pawnEndgame(
  //   'pawnEndgame',
  //   'Pawn Endgame',
  //   "The pawn endgame is a chess endgame in which only the pawns and kings remain on the board",
  //   Colors.green,
  // ),
  trappedPiece(
    'trappedPiece',
    'Traps',
    "A trapped piece is a piece that has no escape squares or squares where it can safely move without being captured. A trapped piece can be a bishop, knight, rook, or queen",
    Colors.amber,
  ),
  capturingDefender(
    'capturingDefender',
    'Capturing Defender',
    "In chess, removing the defender (or removing the guard) happens when a player captures a piece that has been performing a defensive role. The removed piece could be defending other pieces or squares",
    Colors.deepOrange,
  );

  const _SupportedPuzzleStats(
    this.lichessApiName,
    this.appName,
    this.description,
    this.color,
  );

  final String lichessApiName;
  final String appName;
  final String description;
  final Color color;
}
