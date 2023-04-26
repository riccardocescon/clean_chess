import 'package:cleanchess/core/clean_chess/presentation/widgets/homepage_mode_items.dart'
    as homepage_mode_items;
import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:cleanchess/core/presentation/bloc/utilities/cubit_helper.dart';
import 'package:cleanchess/core/utilities/enum_themes.dart';
import 'package:cleanchess/core/utilities/parser.dart' as parser;
import 'package:cleanchess/features/clean_chess/presentation/blocs/puzzle_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/pages/match_page.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/animated_board_piece.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/chessboard.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/chessboard_interpreter.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/homepage_appbar.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/streaming_widget.dart';
import 'package:cleanchess/injection_container.dart';
import 'package:dartchess/dartchess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shared_tools/flutter_shared_tools.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart' as lichess;
import 'package:cleanchess/core/utilities/secure_storage_helper.dart'
    as secure_storage_helper;

lichess.User? user;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  PieceAnimation pieceAnimation = PieceAnimation.none;
  BoardTheme boardTheme = BoardTheme.horsey;

  void _loadSettings() {
    secure_storage_helper.getAnimationType().then((value) {
      setState(() {
        pieceAnimation = value;
      });
    });

    secure_storage_helper.getBoardTheme().then((value) {
      setState(() {
        boardTheme = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();

    _loadSettings();

    sl<CubitHelper>().loadHomepage();
  }

  @override
  Widget build(BuildContext context) {
    // Fetch user profile data
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(
                k4dp,
              ),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  HomepageAppbar(
                    onSettingsApplied: _loadSettings,
                  ),
                ]),
              ),
            ),
            _modesList(),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  heigth20,
                  _dailyPuzzleSection(completed: false),
                  heigth20,
                  _liveStreamingText(),
                  heigth10,
                ],
              ),
            ),
            StreamingWidget(
              pieceAnimation: pieceAnimation,
              boardTheme: boardTheme,
            ),
          ],
        ),
      ),
    );
  }

  Widget _modesList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => homepage_mode_items.preReleaseModes(
          context,
          () => user?.id ?? '',
          () => pieceAnimation,
          () => boardTheme,
        )[index],
        childCount: homepage_mode_items
            .preReleaseModes(
              context,
              () => user?.id ?? '',
              () => pieceAnimation,
              () => boardTheme,
            )
            .length,
      ),
    );
  }

  Widget _dailyPuzzleSection({required bool completed}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.lightBlue,
              radius: 5,
            ),
            width10,
            // Temp GestureDetector
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MatchPage(
                        gameMode: '3+0 Blitz Rated',
                        white: const lichess.User(
                          username: 'RiccardoCescon',
                          title: lichess.Title.lm,
                          perfs: lichess.Perfs(
                            blitz: lichess.Perf(
                              rating: 2829,
                            ),
                          ),
                        ),
                        black: const lichess.User(
                          username: 'Hardal',
                          title: lichess.Title.gm,
                          perfs: lichess.Perfs(
                            blitz: lichess.Perf(
                              rating: 3018,
                            ),
                          ),
                        ),
                        pieceAnimation: pieceAnimation,
                        boardTheme: boardTheme,
                      );
                    },
                  ),
                );
              },
              child: const Text(
                'Puzzle of the day',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        heigth10,
        AspectRatio(
          aspectRatio: 1,

          child: BlocBuilder<PuzzleCubit, PuzzleState>(
            builder: (context, state) {
              return state.maybeMap(
                dailyPuzzle: (value) {
                  final pgn = value.puzzle.game!.pgn!;
                  final fen = parser.pgnToFen(pgn);
                  return ChessboardInterpreter(
                    controller: PuzzleController(setup: Setup.parseFen(fen)),
                    boardTheme: boardTheme,
                    pieceAnimation: pieceAnimation,
                    onPromotion: (_) async => Role.queen,
                  );
                },
                orElse: () {
                  return Chessboard(
                    boardTheme: boardTheme,
                  );
                },
              );
            },
          ),
          // child: Stack(
          //   children: [
          //     const Chessboard(),
          //     Visibility(
          //       visible: completed,
          //       child: Container(
          //         color: Colors.grey.withAlpha(50),
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ],
    );
  }

  Widget _onlineInfo() {
    return SliverPadding(
      padding: const EdgeInsets.all(k10dp),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _text('100.000 Players'),
                _text('50.000 Games'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _liveStreamingText() {
    return Column(
      children: [
        Column(
          children: [
            const SizedBox(width: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 5,
                ),
                SizedBox(width: 10),
                Text(
                  'Live',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              'Streaming right now',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withAlpha(50),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _text(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
