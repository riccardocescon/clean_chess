import 'package:cleanchess/features/clean_chess/presentation/pages/stats_screen.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/chessboard.dart';
import 'package:flutter/material.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/profilepage_mode_items.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.username,
    required this.memberSince,
    required this.followerNum,
    required this.onlineStatus,
    required this.fullName,
    required this.bio,
    required this.timeplayed,
    required this.isFollowing,
    required this.userid,
    required this.wonGames,
    required this.lostGames,
    required this.drawnGames,
  });

  final backgroundColor = const Color.fromARGB(225, 17, 17, 17);

  ///
  final String username;

  final String memberSince;

  final int followerNum;

  final String fullName;

  final String bio;

  final int timeplayed;

  final String userid;

  final int wonGames;

  final int lostGames;

  final int drawnGames;

  final bool isFollowing;

  final bool onlineStatus;

  final List<Widget> popUpMenuList = const [
    Text("Report"),
    Text("Block"),
    Text("Send Message"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: _appbar(context),
        body: _body(),
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      shadowColor: Colors.transparent,
      actions: [
        PopupMenuButton(
          icon: const Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          itemBuilder: (context) {
            return popUpMenuList.map((e) {
              return PopupMenuItem(
                child: e,
              );
            }).toList();
          },
        ),
      ],
      backgroundColor: backgroundColor,
    );
  }

  Widget _body() {
    return DefaultTextStyle(
      style: const TextStyle(
        color: Colors.white,
      ),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          _about(
            userid: userid,
            username: username,
            memberSince: memberSince,
            followerNum: followerNum,
            isOnline: onlineStatus,
          ),
          _buttons(isFollowing: isFollowing),
          _bio(fullName: fullName, bio: bio),
          _ongoingGames(),
          _stats(
            timeplayed: timeplayed,
            wonGames: wonGames,
            lostGames: lostGames,
            drawnGames: drawnGames,
          ),
        ],
      ),
    );
  }
}

//Username, online status, member since, followers
Widget _about({
  required String username,
  required String memberSince,
  required int followerNum,
  required bool isOnline,
  required String userid,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _usernameRow(username),
      _userId(userid),
      _onlineStatus(isOnline),
      _socialRow(memberSince, followerNum.toString()),
    ],
  );
}

//#region About Widgets
Widget _usernameRow(String username) => Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 30, right: 8),
          child: Text(
            username,
            style: const TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 37.5),
          child: Image(
            image: AssetImage("assets/icons/flags/italy_flag.png"),
            height: 30,
          ),
        ),
      ],
    );

Widget _userId(String userId) => Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 10),
      child: Text(
        "@$userId",
        style: const TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
      ),
    );

Widget _onlineStatus(bool isOnline) => Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Text(
        isOnline ? "Online" : "Offline",
        style: TextStyle(
          color: isOnline ? Colors.green : Colors.red,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

Widget _socialRow(String memberSince, String followerNum) => InkWell(
      onTap: () {
        followersButtonPressed();
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text("Member since: $memberSince"),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 65, right: 5),
            child: Icon(Icons.people),
          ),
          Text(followerNum),
        ],
      ),
    );

//#endregion

//Challenge to game and follow
Widget _buttons({required bool isFollowing}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _challengeButton(),
        _followButton(),
      ],
    ),
  );
}

//#region challenge and follow buttons

Widget _challengeButton() => Padding(
      padding: const EdgeInsets.only(left: 12, right: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          minimumSize: const Size(175, 35),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          challengeButtonPressed();
        },
        child: const Row(
          children: [
            ImageIcon(
              AssetImage("assets/icons/swords.png"),
              color: Colors.white,
              size: 20,
            ),
            Text(
              " Challenge",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );

Widget _followButton() => ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        //isFollowing ? Colors.green : Colors.grey.shade900,
        minimumSize: const Size(190, 35),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        followButtonPressed();
      },
      child: const Row(
        children: [
          Icon(
            Icons.person_add,
            //isFollowing ? Icons.person_add : Icons.person_add_disabled,

            color: Colors.white,
            size: 20,
          ),
          Text(
            " Follow",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );

//#endregion

//Fullname and bio
Widget _bio({required String fullName, required String bio}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 15, top: 10, bottom: 20),
        child: Text(
          fullName,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        child: Text(bio),
      ),
    ],
  );
}

//Ongoing games board and text
Widget _ongoingGames() {
  return Column(
    children: [
      _ongoinGamesText(),
      _ongoingBoard(),
    ],
  );
}

//#region Ongoing games

Widget _ongoinGamesText() {
  return const Padding(
    padding: EdgeInsets.only(left: 15, top: 45),
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 5),
          child: Icon(
            Icons.circle,
            color: Colors.green,
            size: 10,
          ),
        ),
        Text(
          "Ongoing Games",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget _ongoingBoard() {
  return SizedBox(
    height: 180,
    child: Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _chessboard(gameType: "3+2", opponentName: "hardal", gameid: 1),
          _chessboard(gameType: "1 day", opponentName: "alexrintt", gameid: 2),
          _chessboard(gameType: "10+5", opponentName: "foobar", gameid: 3),
        ],
      ),
    ),
  );
}

//#endregion

//Stats
Widget _stats({
  required int timeplayed,
  required int wonGames,
  required int drawnGames,
  required int lostGames,
}) {
  return Column(
    children: [
      Column(
        children: [
          _statsText(),
          _timeplayedWDL(
            timeplayed: timeplayed,
            wonGames: wonGames,
            drawnGames: drawnGames,
            lostGames: lostGames,
          ),
          //Scrollable list of stats
          SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                      child: modeItems[index],
                      onTap: () {
                        navigateToStatsPage(context);
                      });
                },
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

//#region Stats Widgets

Widget _statsText() {
  return const Padding(
    padding: EdgeInsets.only(left: 15, top: 30),
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 5),
          child: Icon(
            Icons.circle,
            color: Colors.blue,
            size: 10,
          ),
        ),
        Text(
          "Stats",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget _timeplayedWDL({
  required int timeplayed,
  required int wonGames,
  required int drawnGames,
  required int lostGames,
}) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 70),
        child: Text("Time played: $timeplayed hours"),
      ),
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "${wonGames}W",
              style: const TextStyle(color: Colors.green),
            ),
            TextSpan(
              text: " / ${drawnGames}D / ",
              style: const TextStyle(color: Colors.grey),
            ),
            TextSpan(
              text: "${lostGames}L",
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    ],
  );
}

//#endregion

//Chessboards with username and match type for ongoing games
Widget _chessboard({
  required String opponentName,
  required String gameType,
  required int gameid,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 20),
    child: Column(
      children: [
        InkWell(
          onTap: () {
            gamesButtonPressed(gameid);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const SizedBox(
              height: 144,
              width: 144,
              child: InkWell(
                child: Chessboard(),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 7),
          child: Text(
            "$opponentName $gameType",
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ],
    ),
  );
}

//Gets called when user clicks on the follow button
void followButtonPressed() {}

//Gets called when user clicks on the challenge button
void challengeButtonPressed() {}

//Gets called when user clicks on a game board
void gamesButtonPressed(gameid) {}

//Gets called when user clicks on a stats card
void statsButtonPressed(gameMode) {}

//Gets called when user clicks on the number of followers
void followersButtonPressed() {}

//Gets called when user clicks on the three vertical dots
void popupMenuButtonPressed() {}

//Navigates to stats page
void navigateToStatsPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const StatsPage()),
  );
}
