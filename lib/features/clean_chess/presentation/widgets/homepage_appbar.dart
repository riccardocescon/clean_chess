import 'package:auto_size_text/auto_size_text.dart';
import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:cleanchess/features/clean_chess/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shared_tools/flutter_shared_tools.dart';

class HomepageAppbar extends StatefulWidget {
  const HomepageAppbar({super.key});

  @override
  State<HomepageAppbar> createState() => _HomepageAppbarState();
}

class _HomepageAppbarState extends State<HomepageAppbar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // pinned: false,
      snap: true,
      floating: true,
      automaticallyImplyLeading: false,
      title: _accountName(context),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings_outlined,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _accountName(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () => navigateToStatsPage(context),
        customBorder: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(k8dp),
        ),
        // elevation: MaterialStateProperty.all<double>(0),
        child: Material(
          color: lightDark,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(k8dp),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: k4dp, horizontal: k6dp),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircleAvatar(
                  backgroundColor: Colors.green,
                  maxRadius: 5,
                ),
                Padding(padding: EdgeInsets.all(k2dp)),
                Flexible(
                  child: Text(
                    'Username',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _pushToProfilePage(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfileScreen(
            username: 'Logos',
            memberSince: '21 February 2021',
            followerNum: 7721,
            onlineStatus: true,
            fullName: 'Logos Ethos Pathos',
            bio:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
            timeplayed: 100,
            isFollowing: true,
            userid: 'logos',
            wonGames: 40,
            lostGames: 30,
            drawnGames: 30,
          ),
        ),
      );
}
