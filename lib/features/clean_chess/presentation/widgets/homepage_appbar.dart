import 'package:auto_size_text/auto_size_text.dart';
import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:cleanchess/features/clean_chess/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';

class HomepageAppbar extends StatelessWidget {
  const HomepageAppbar({super.key});

  @override
  Widget build(BuildContext context) => Container(
        width: double.maxFinite,
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _accountName(context),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Text(
              'Clean Chess',
              style: TextStyle(
                color: Colors.white.withAlpha(50),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );

  Widget _accountName(BuildContext context) => ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.28),
        child: ElevatedButton(
          onPressed: () => _pushToProfilePage(context),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(lightDark),
            elevation: MaterialStateProperty.all<double>(0),
          ),
          child: Row(
            children: const [
              CircleAvatar(
                backgroundColor: Colors.green,
                maxRadius: 5,
              ),
              SizedBox(width: 5),
              Expanded(
                child: AutoSizeText(
                  'Username',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                  maxFontSize: 16,
                  minFontSize: 12,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      );

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
