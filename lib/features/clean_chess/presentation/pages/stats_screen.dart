import 'package:cleanchess/core/presentation/bloc/utilities/cubit_helper.dart';
import 'package:cleanchess/core/utilities/extentions.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/game_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/user_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/pages/homepage.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/chart.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/profilepage_mode_items.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/stats_game_card.dart';
import 'package:cleanchess/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart' as lichess;

late PerfMode _selectedGameMode;
late lichess.RatingHistory _ratingHistory;

@override
class StatsPage extends StatelessWidget {
  final backgroundColor = const Color.fromARGB(225, 17, 17, 17);

  final int numberOfGames;

  final List<lichess.LichessGame> _games = [];

  final void Function() onNextMode;

  final void Function() onPreviousMode;

  StatsPage({
    super.key,
    required this.numberOfGames,
    required PerfMode selectedGameMode,
    required this.onNextMode,
    required this.onPreviousMode,
  }) {
    _selectedGameMode = selectedGameMode;
  }

  @override
  Widget build(BuildContext context) {
    if (user?.username != null) {
      sl<CubitHelper>().loadModeStats(
        username: user!.username!,
        mode: _selectedGameMode.perfType,
      );
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: _appbar(context),
        body: _body(context),
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      shadowColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          sl<GameCubit>().stopExportingGames();
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: const TextStyle(
          color: Colors.white,
        ),
        child: BlocConsumer<GameCubit, GameState>(
          listener: (context, state) {
            state.maybeMap(
              gameExported: (value) => _games.add(value.game),
              orElse: () {},
            );
          },
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      _chart(context),
                      _gamesPlayedText(context),
                    ],
                  ),
                ),
                BlocConsumer<GameCubit, GameState>(
                  listener: (context, state) {
                    state.maybeMap(
                      gameExported: (value) => _games.add(value.game),
                      orElse: () {},
                    );
                  },
                  builder: (context, state) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return SizedBox(
                            width: 400,
                            height: 200,
                            child: GamesCard(game: _games[index]),
                          );
                        },
                        childCount: _games.length,
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _chart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 35),
      child: Column(
        children: [
          topTitleWidgets(context),
          SizedBox(
            height: 250,
            child: BlocConsumer<UserCubit, UserState>(
              listener: (context, state) {
                state.maybeMap(
                  ratingHistory: (value) {
                    _ratingHistory = value.ratings.firstWhere(
                      (element) =>
                          element.name?.toLowerCase() ==
                          _selectedGameMode.perfType.name.toLowerCase(),
                    );
                  },
                  orElse: () {},
                );
              },
              builder: (context, state) {
                return state.maybeMap(
                  ratingHistory: (value) {
                    return Chart(
                      mode: _selectedGameMode.gameMode,
                      history: _ratingHistory,
                    );
                  },
                  orElse: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

//#endregion

//#region Chart widgets

  Widget topTitleWidgets(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: onPreviousMode,
            ),
            Text(
              _selectedGameMode.gameMode.name,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: onNextMode,
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "$elo",
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$resultElo",
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
                    color: _selectedGameMode.color,
                  ),
                ),
                Icon(Icons.arrow_drop_up, color: _selectedGameMode.color),
              ],
            ), //TODO color
          ],
        ),
      ],
    );
  }

  Widget _gamesPlayed(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return SizedBox(
          width: 400,
          height: 200,
          child: GamesCard(game: _games[index]),
        );
      },
      itemCount: _games.length,
    );
  }

  Widget _gamesPlayedText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 20),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(
              Icons.circle,
              color: Colors.pink,
              size: 10,
            ),
          ),
          Text(
            "$numberOfGames ${_selectedGameMode.gameMode.name} Games",
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
