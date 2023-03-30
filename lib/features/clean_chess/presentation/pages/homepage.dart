import 'dart:async';

import 'package:cleanchess/core/clean_chess/presentation/widgets/homepage_mode_items.dart'
    as homepage_mode_items;
import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/event/account_event.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/server_bloc.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/server_state.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/tv_bloc.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/chessboard.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/homepage_appbar.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/padded_items.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/streaming_widget.dart';
import 'package:cleanchess/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

User? user;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TvGameStreamBloc get _tvGameStreamBloc => sl<TvGameStreamBloc>();
  late StreamSubscription<AsyncSnapshot<LichessTvGameSummary>> _listener;

  @override
  void initState() {
    super.initState();

    _tvGameStreamBloc.startStreaming();
  }

  @override
  void dispose() {
    _listener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fetch user profile data
    BlocProvider.of<ServerBloc>(context).add(const AccountEvent.getMyProfile());
    return BlocListener<ServerBloc, ServerState>(
      listener: (context, state) {
        if (state is LichessUserFetched) {
          user = state.user;
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: _customScrollView(
            children: [
              PaddedItems(
                children: [
                  const HomepageAppbar(),
                  //TODO: @alexrintt's slidebar
                  _modesList(),
                  heigth5,
                  _onlineInfo(),
                  _sortedLivePuzzle(completed: false),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sortedLivePuzzle({required bool completed}) {
    return Column(
      children: completed
          ? [
              heigth20,
              _liveStreamingText(),
              heigth10,
              const StreamingWidget(),
              heigth20,
              _dailyPuzzleSection(completed: true),
            ]
          : [
              heigth20,
              _dailyPuzzleSection(completed: false),
              heigth20,
              _liveStreamingText(),
              heigth10,
              const StreamingWidget(),
            ],
    );
  }

  Widget _customScrollView({required List<Widget> children}) =>
      CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(children),
          ),
        ],
      );

  Widget _modesList() => SizedBox(
        height: modeItemHeigth * 3,
        child: ListView.builder(
          itemCount: homepage_mode_items.playModes.length,
          itemBuilder: (context, index) => homepage_mode_items.playModes[index],

          // itemCount: homepage_mode_items.learnModes.length,
          // itemBuilder: (context, index) =>
          //     homepage_mode_items.learnModes[index],

          // itemCount: homepage_mode_items.toolsModes.length,
          // itemBuilder: (context, index) =>
          //     homepage_mode_items.toolsModes[index],

          // itemCount: homepage_mode_items.communityModes.length,
          // itemBuilder: (context, index) =>
          //     homepage_mode_items.communityModes[index],
        ),
      );

  Widget _dailyPuzzleSection({required bool completed}) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                backgroundColor: Colors.lightBlue,
                radius: 5,
              ),
              width10,
              Text(
                'Puzzle of the day',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          heigth10,
          AspectRatio(
            aspectRatio: 1,
            child: BlocBuilder<TvGameStreamBloc,
                AsyncSnapshot<LichessTvGameSummary>>(
              bloc: _tvGameStreamBloc,
              builder: (context, state) {
                return Chessboard(fen: state.data?.data?.fen);
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

  Widget _onlineInfo() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _text('100.000 Players'),
          _text('50.000 Games'),
        ],
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
