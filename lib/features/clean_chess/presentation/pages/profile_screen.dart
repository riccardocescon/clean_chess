import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final backgroundColor = const Color.fromARGB(225, 17, 17, 17);

  ///
  final String username = "Logos";
  final String memberSince = "21 February 2021";
  final int followerNum = 7721;
  bool onlineStatus = true;
  final String fullName = "Logos Ethos Pathos";
  final String bio =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";
  final int timeplayed = 100;
  bool isFollowing = false;
  final opponentName = "hardal";
  final gameType = "3+2";
  final userid = "logos";
  final wonGames = 40;
  final lostGames = 30;
  final drawnGames = 30;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: _appbar(),
        body: _body(),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      shadowColor: Colors.transparent,
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert, size: 30),
          onPressed: () {
            //report && block
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
              onlineStatus: onlineStatus),
          _buttons(isFollowing: isFollowing),
          _bio(fullName: fullName, bio: bio),
          _ongoingGames(gameType: gameType, opponentName: opponentName),
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
  required bool onlineStatus,
  required String userid,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
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
                height: 30),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15, bottom: 10),
        child: Text(
          "@$userid",
          style: const TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Text(
          onlineStatus ? "Online" : "Offline",
          style: TextStyle(
              color: onlineStatus ? Colors.green : Colors.red,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text("Member since: $memberSince"),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 65, right: 5),
            child: Icon(Icons.people),
          ),
          Text(followerNum.toString()),
        ],
      )
    ],
  );
}

//Challenge and follow buttons
Widget _buttons({required bool isFollowing}) {
  return Row(
    children: [
      //Challenge button
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink,
            minimumSize: const Size(150, 35),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            //challenge
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
      ),
      //follow button
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isFollowing
              ? Colors.green
              : const Color.fromARGB(225, 27, 27, 27),
          minimumSize: const Size(200, 35),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          isFollowing = !isFollowing;

          //follow
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Icon(
                  color: Colors.white,
                  isFollowing ? Icons.person_add : Icons.person_remove_alt_1),
            ),
            Text(isFollowing ? "Follow" : "Unfollow",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    ],
  );
}

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

//Ongoing games
Widget _ongoingGames({required String opponentName, required String gameType}) {
  return Column(
    children: [
      const Padding(
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
            Text("Ongoing Games",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      //Vertical Scrollable list of games
      SizedBox(
        height: 180,
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _chessboard(gameType: gameType, opponentName: opponentName),
              _chessboard(gameType: gameType, opponentName: opponentName),
              _chessboard(gameType: gameType, opponentName: opponentName),
            ],
          ),
        ),
      ),
    ],
  );
}

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
          const Padding(
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
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
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          //Scrollable list of stats
          SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _statsCard(
                    gameMode: "Bullet",
                    elo: "1322",
                    icon: Icons.speed,
                    statsCardColor: const Color.fromARGB(223, 214, 25, 88),
                  ),
                  _statsCard(
                    gameMode: "Blitz",
                    elo: "2114",
                    icon: Icons.flash_on,
                    statsCardColor: const Color.fromARGB(223, 138, 249, 54),
                  ),
                  _statsCard(
                    gameMode: "Rapid",
                    elo: "954",
                    icon: Icons.timer,
                    statsCardColor: const Color.fromARGB(223, 21, 173, 255),
                  ),
                  _statsCard(
                    gameMode: "Classical",
                    elo: "771",
                    icon: Icons.house,
                    statsCardColor: const Color.fromARGB(223, 214, 25, 88),
                  ),
                  _statsCard(
                    gameMode: "Daily",
                    elo: "2731",
                    icon: Icons.sunny,
                    statsCardColor: const Color.fromARGB(223, 138, 249, 54),
                  ),
                  _statsCard(
                    gameMode: "Puzzles",
                    elo: "1533",
                    icon: Icons.lightbulb,
                    statsCardColor: const Color.fromARGB(223, 21, 173, 255),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

//Chessboards for ongoing games
Widget _chessboard({required String opponentName, required String gameType}) {
  return Padding(
    padding: const EdgeInsets.only(right: 20),
    child: Column(
      children: [
        Container(
          height: 140,
          width: 140,
          color: Colors.blue,
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

//Stats card for stats
Widget _statsCard({
  required String gameMode,
  required String elo,
  required IconData icon,
  required Color statsCardColor,
}) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          //navigate to stats page
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Container(
            width: 125,
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: statsCardColor.withOpacity(0.5)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: statsCardColor,
                    ),
                    child: Icon(
                      icon,
                      size: 60,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(gameMode,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500)),
                Text(
                  elo,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
