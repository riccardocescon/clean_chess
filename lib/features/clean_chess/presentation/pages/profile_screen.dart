import 'package:cleanchess/core/presentation/bloc/utilities/cubit_helper.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/game_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/social_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/user_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/pages/puzzle_dashboard_page.dart';
import 'package:cleanchess/features/clean_chess/presentation/pages/stats_screen.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/chessboard.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/loading_skeleton.dart';
import 'package:cleanchess/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/profilepage_mode_items.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart' as lichess;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
    required this.user,
  });

  final lichess.User user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final backgroundColor = const Color.fromARGB(225, 17, 17, 17);

  final kIconsHeigth = 20.0;
  final kChallengeButtonMinSize = const Size(175, 35);
  final kChallengeButtonColor = Colors.pink;
  final kFollowButtonMinSize = const Size(190, 35);
  final kButtonsRadius = BorderRadius.circular(8);
  final kFollowButtonColor = Colors.green;
  final kUnfollowButtonColor = Colors.pink;
  final kIconsColor = Colors.white;
  final kOnGoingHeigth = 180.0;
  final kChessboardSize = 114.0;
  final kStatsHeigth = 200.0;

  lichess.RealTimeUserStatus? _realTimeUserStatus;
  List<lichess.User>? _followingUsers;

  final List<Text> popUpMenuList = const [
    Text("Report"),
    Text("Block"),
    Text("Send Message"),
  ];

  int _index = 0;

  @override
  void initState() {
    sl<CubitHelper>().loadProfile(widget.user.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // _requestRealTimeStatus(context);
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
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      shadowColor: Colors.transparent,
      actions: [
        PopupMenuButton(
          icon: Icon(
            Icons.more_vert,
            color: kIconsColor,
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

  Widget _body(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: kIconsColor,
      ),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          _about(context),
          _buttons(),
          _bio(),
          _ongoingGames(context),
          _stats(context),
        ],
      ),
    );
  }

//Username, online status, member since, followers
  Widget _about(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _usernameRow(context),
        _userId(context),
        _onlineStatus(),
        _socialRow(),
      ],
    );
  }

//#region About Widgets
  Widget _usernameRow(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 30, right: 8),
          child: Text(
            widget.user.username ?? "{username}",
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 37.5),
          child: 
            // thanks to https://github.com/lipis/flag-icons
            SvgPicture.asset("assets/icons/flags/${widget.user.profile?.country?.toLowerCase() ?? "xx"}.svg", height: kIconsHeigth)
        ),
      ],
    );
  }

  Widget _userId(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 10),
      child: Text(
        '@${widget.user.id ?? {"userid"}}',
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _onlineStatus() {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          state.maybeMap(
            realtimeStatus: (value) {
              _realTimeUserStatus = value.realtimeStatus.first;
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          if (_realTimeUserStatus == null) {
            return LoadingSkeleton.small();
          }
          final isOnline = _realTimeUserStatus!.online;
          return Text(
            isOnline ? "Online" : "Offline",
            style: TextStyle(
              color: isOnline ? Colors.green : Colors.red,
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );
  }

  Widget _socialRow() {
    final memberSince = DateFormat('dd/mm/yyyy').format(
      DateTime.fromMillisecondsSinceEpoch(widget.user.createdAt ?? 0),
    );
    return InkWell(
      onTap: () {
        followersButtonPressed();
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "Member since: $memberSince",
            ),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 65, right: 5),
                child: Icon(Icons.people),
              ),
              BlocConsumer<SocialCubit, SocialState>(
                listener: (context, state) {
                  state.maybeMap(
                    followingUsers: (value) {
                      _followingUsers = value.users;
                    },
                    orElse: () {},
                  );
                },
                builder: (context, state) {
                  if (_followingUsers == null) {
                    return LoadingSkeleton.small();
                  }
                  return Text(_followingUsers!.length.toString());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

//#endregion
  Widget _buttons() {
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
            backgroundColor: kChallengeButtonColor,
            minimumSize: kChallengeButtonMinSize,
            shape: RoundedRectangleBorder(
              borderRadius: kButtonsRadius,
            ),
          ),
          onPressed: () {
            challengeButtonPressed();
          },
          child: Row(
            children: [
              ImageIcon(
                const AssetImage("assets/icons/swords.png"),
                color: kIconsColor,
                size: kIconsHeigth,
              ),
              Text(
                " Challenge",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kIconsColor,
                ),
              ),
            ],
          ),
        ),
      );

  Widget _followButton() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kFollowButtonColor,
          //isFollowing ? Colors.green : Colors.grey.shade900,
          minimumSize: kFollowButtonMinSize,
          shape: RoundedRectangleBorder(
            borderRadius: kButtonsRadius,
          ),
        ),
        onPressed: () {
          followButtonPressed();
        },
        child: Row(
          children: [
            Icon(
              Icons.person_add,
              //isFollowing ? Icons.person_add : Icons.person_add_disabled,

              color: kIconsColor,
              size: kIconsHeigth,
            ),
            Text(
              " Follow",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kIconsColor,
              ),
            ),
          ],
        ),
      );

//#endregion
  Widget _bio() {
    final name = widget.user.profile?.firstName ?? widget.user.username;
    final surname = widget.user.profile?.lastName ?? "";
    final bio = widget.user.profile?.bio ?? "";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10, bottom: 20),
          child: Text(
            "$name $surname",
            style: const TextStyle(fontWeight: FontWeight.bold),
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
  Widget _ongoingGames(BuildContext context) {
    return Column(
      children: [
        _ongoinGamesText(context),
        _ongoingBoard(),
      ],
    );
  }

//#region Ongoing games
  Widget _ongoinGamesText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 45),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(
              Icons.circle,
              color: Colors.green,
              size: 10,
            ),
          ),
          Text(
            "Ongoing Games",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
            ),
          ),
        ],
      ),
    );
  }

  Widget _ongoingBoard() {
    return SizedBox(
      height: kOnGoingHeigth,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _chessboard(gameType: "3+2", opponentName: "hardal", gameid: 1),
            _chessboard(
                gameType: "1 day", opponentName: "alexrintt", gameid: 2),
            _chessboard(gameType: "10+5", opponentName: "foobar", gameid: 3),
          ],
        ),
      ),
    );
  }

  // Class [PerfMode] will be implemented inside LichessClient
  List<PerfMode> get _supportedStats => [
        PerfMode(widget.user.perfs!.bullet!, GameMode.bullet),
        PerfMode(widget.user.perfs!.blitz!, GameMode.blitz),
        PerfMode(widget.user.perfs!.rapid!, GameMode.rapid),
        PerfMode(widget.user.perfs!.classical!, GameMode.classical),
        PerfMode(widget.user.perfs!.correspondence!, GameMode.daily),
        PerfMode(widget.user.perfs!.puzzle!, GameMode.puzzle),
      ];

//#endregion
  Widget _stats(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            _statsText(context),
            _timeplayedWDL(),
            //Scrollable list of stats
            SizedBox(
              height: kStatsHeigth,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                child: ListView.builder(
                  itemCount: _supportedStats.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: statsCard(
                        mode: _supportedStats[index],
                      ),
                      onTap: () {
                        final PerfMode selectedMode = _supportedStats[index];
                        if (selectedMode.gameMode == GameMode.puzzle) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PuzzleDashboardPage(),
                            ),
                          );
                        } else {
                          _index = index;
                          navigateToStatsPage(context, selectedMode);
                        }
                      },
                    );
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
  Widget _statsText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 30),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(
              Icons.circle,
              color: Colors.blue,
              size: 10,
            ),
          ),
          Text(
            "Stats",
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _timeplayedWDL() {
    final timeplayed =
        Duration(milliseconds: widget.user.playTime?.total ?? 0).inHours;
    final wonGames = widget.user.count?.win ?? 0;
    final drawnGames = widget.user.count?.draw ?? 0;
    final lostGames = widget.user.count?.loss ?? 0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Time played: $timeplayed hours"),
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
      ),
    );
  }

//#endregion
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
              borderRadius: kButtonsRadius,
              child: SizedBox(
                height: kChessboardSize,
                width: kChessboardSize,
                child: const InkWell(
                  child: Chessboard(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Text(
              "$opponentName $gameType",
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
  void navigateToStatsPage(BuildContext context, PerfMode mode) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StatsPage(
          numberOfGames: 1,
          selectedGameMode: mode,
          onNextMode: () {
            sl<GameCubit>().stopExportingGames();
            if (_index == _supportedStats.length - 2) {
              _index = -1;
            }
            Navigator.pop(context);
            _index++;
            navigateToStatsPage(context, _supportedStats[_index]);
          },
          onPreviousMode: () {
            sl<GameCubit>().stopExportingGames();
            if (_index == 0) {
              _index = _supportedStats.length - 1;
            }
            Navigator.pop(context);
            _index--;
            navigateToStatsPage(context, _supportedStats[_index]);
          },
        ),
      ),
    );
  }
}
