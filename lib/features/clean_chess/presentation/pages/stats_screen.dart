import 'package:cleanchess/features/clean_chess/presentation/widgets/chart.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/stats_game_card.dart';
import 'package:flutter/material.dart';

int index = 0;

@override
class StatsPage extends StatelessWidget {
  final List<String> gamemode = const [
    "Bullet",
    "Blitz",
    "Rapid",
    "Classical",
    "Daily",
    "Puzzles",
  ];

  final backgroundColor = const Color.fromARGB(225, 17, 17, 17);

  final int numberOfGames;

  //

  const StatsPage({
    super.key,
    required this.numberOfGames,
  });

  @override
  Widget build(BuildContext context) {
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
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
          style: const TextStyle(
            color: Colors.white,
          ),
          child: SizedBox(
            child: ListView(
              children: [
                _chart(context),
                _gamesPlayed(context),
              ],
            ),
          )),
    );
  }

  Widget _chart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 35),
      child: Column(
        children: [
          topTitleWidgets(context),
          const SizedBox(height: 150, child: Chart()),
          bottomTitleWidgets(context),
        ],
      ),
    );
  }

//#region Chart widgets

  Widget topTitleWidgets(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                if (index > 0) {
                  index--;
                } else {
                  index = 5;
                }
              },
            ),
            Text(gamemode[index],
                style: TextStyle(
                  fontSize:
                      Theme.of(context).textTheme.headlineMedium?.fontSize,
                  fontWeight: FontWeight.bold,
                )),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {
                if (index < 5) {
                  index++;
                } else {
                  index = 0;
                }
              },
            ),
          ],
        ),
        Column(
          children: [
            Text("$elo",
                style: TextStyle(
                    fontSize:
                        Theme.of(context).textTheme.headlineSmall?.fontSize,
                    fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$resultElo",
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.labelLarge?.fontSize,
                        color: Colors.green)),
                const Icon(Icons.arrow_drop_up, color: Colors.green),
              ],
            ), //TODO color
          ],
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "21 April",
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize),
          ),
          Text(
            "21 May",
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize),
          ), //TODO date
        ],
      ),
    );
  }

  Widget _gamesPlayed(BuildContext context) {
    return Column(
      children: [
        _gamesPlayedText(context),
        ListBody(
          children: const [
            //FIXME

            SizedBox(
              width: 400,
              height: 180,
              child: GamesCard(
                gainedElo: 4,
                gainedEloOpponent: -6,
                gameDate: "Yesterday at 22:05",
                gameMode: "Standart",
                gameTime: "2 + 1",
                openingName: "Scandavian Defense",
                opponentRating: 1324,
                opponentname: "alexrintt",
                rating: 1233,
                result: "White timed out, black is victorious",
                username: "hardal",
              ),
            ),

            SizedBox(
              width: 400,
              height: 180,
              child: GamesCard(
                gainedElo: 6,
                gainedEloOpponent: -8,
                gameDate: "Last Wednesday at 15:42",
                gameMode: "Standart",
                gameTime: "1 + 0",
                openingName: "Tennison Gambit",
                opponentRating: 1225,
                opponentname: "riccardocescon",
                rating: 1211,
                result: "Black timed out, white is victorious",
                username: "hardal",
              ),
            ),

            SizedBox(
              width: 400,
              height: 180,
              child: GamesCard(
                gainedElo: 4,
                gainedEloOpponent: -2,
                gameDate: "29/02/2023",
                gameMode: "Anti-Chess",
                gameTime: "1 + 1",
                openingName: "Queen's Gambit",
                opponentRating: 1324,
                opponentname: "chesslover31",
                rating: 1188,
                result: "Draw by repetition",
                username: "hardal",
              ),
            ),
          ],
        ),
      ], //Test
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
          Text("$numberOfGames ${gamemode[index]} Games",
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                fontWeight: FontWeight.w500,
              )),
        ],
      ),
    );
  }
}
