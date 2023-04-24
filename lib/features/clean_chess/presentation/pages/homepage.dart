import 'package:cleanchess/core/clean_chess/presentation/widgets/homepage_mode_items.dart'
    as homepage_mode_items;
import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/account_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/pages/match_page.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/chessboard.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/homepage_appbar.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/streaming_widget.dart';
import 'package:cleanchess/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shared_tools/flutter_shared_tools.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart' as lichess;

lichess.User? user;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();

    sl<AccountCubit>().getMyProfile();
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
                  const HomepageAppbar(),
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
            const StreamingWidget(),
          ],
        ),
      ),
    );
  }

  Widget _modesList() => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => homepage_mode_items.preReleaseModes(
              context, () => user?.id ?? '')[index],
          childCount: homepage_mode_items
              .preReleaseModes(context, () => user?.id ?? '')
              .length,
        ),
      );

  Widget _dailyPuzzleSection({required bool completed}) => Column(
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
                        return const MatchPage(
                          gameMode: '3+0 Blitz Rated',
                          white: lichess.User(
                            username: 'RiccardoCescon',
                            title: lichess.Title.lm,
                            perfs: lichess.Perfs(
                              blitz: lichess.Perf(
                                rating: 2829,
                              ),
                            ),
                          ),
                          black: lichess.User(
                            username: 'Hardal',
                            title: lichess.Title.gm,
                            perfs: lichess.Perfs(
                              blitz: lichess.Perf(
                                rating: 3018,
                              ),
                            ),
                          ),
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
          const AspectRatio(
            aspectRatio: 1,

            child: Chessboard(),
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

  Widget _onlineInfo() => SliverPadding(
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

  Widget _liveStreamingText() => Column(
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

  Widget _text(String text) => Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );
}
