import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final backgroundColor = const Color.fromARGB(225, 27, 27, 27);
  final String username = "Logos";
  final String memberSince = "21 February 2 2021";
  final int followerNum = 7721;
  bool onlineStatus = true;
  final String fullName = "Logos Ethos Pathos";
  final String bio = "lorem ipsum dolor sit amet";
  final int timeplayed = 100;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Padding(
                padding: EdgeInsets.only(right: 100),
                child: Icon(Icons.arrow_back_ios),
              ),
              onPressed: () {
                //back
              },
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                //report && block
              },
            ),
          ],
          backgroundColor: backgroundColor,
        ),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        _about(
            username: username,
            memberSince: memberSince,
            followerNum: followerNum,
            onlineStatus: onlineStatus),
        _buttons(),
        _bio(fullName: fullName, bio: bio),
        _ongoingGames(),
        _stats(timeplayed: timeplayed),
      ],
    );
  }
}

//Online status, member since, followers
Widget _about(
    {required String username,
    required String memberSince,
    required int followerNum,
    required bool onlineStatus}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(username),
      Text(onlineStatus ? "Online" : "Offline",
          style: TextStyle(color: onlineStatus ? Colors.green : Colors.red)),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text("Member since: $memberSince"),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(Icons.people),
          ),
          Text(followerNum.toString()),
        ],
      )
    ],
  );
}

//Challenge and send message buttons
Widget _buttons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      ElevatedButton(
        onPressed: () {
          //challenge
        },
        child: const Text("Challenge"),
      ),
      ElevatedButton(
        onPressed: () {
          //send message
        },
        child: const Text("Send Message"),
      ),
    ],
  );
}

//Fullname and bio
Widget _bio({required String fullName, required String bio}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(fullName),
      ),
      Text(bio),
    ],
  );
}

//Ongoing games
Widget _ongoingGames() {
  return Column(
    children: [
      const Row(
        children: [
          Icon(
            Icons.circle,
            color: Colors.green,
          ),
          Text("Ongoing Games"),
        ],
      ),
      //Vertical Scrollable list of games
      SizedBox(
        height: 200,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: const [
            //Games
          ],
        ),
      ),
    ],
  );
}

//Stats
Widget _stats({required int timeplayed}) {
  return Column(
    children: [
      Column(
        children: [
          const Row(
            children: [
              Icon(
                Icons.circle,
                color: Colors.blue,
              ),
              Text("Stats"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Time played: $timeplayed hours"),
              const Text("40W/30D/40L"),
            ],
          ),
          //Scrollable list of stats
        ],
      ),
    ],
  );
}
