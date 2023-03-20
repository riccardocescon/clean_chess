import 'package:auto_size_text/auto_size_text.dart';
import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/mode_item_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

List<Widget> playModes = [
  _quickMatchItem,
  _puzzleItem,
  _computerItem,
  _friendsItem,
  _tournamentItem,
  _localItem,
];

Widget get _quickMatchItem => ModeItem(
      title: 'Quick match',
      subtitle: 'Play someone at your level',
      color: Colors.pink,
      icon: Image.asset(
        'assets/icons/Crown.png',
        scale: 2,
      ),
      stats: [
        _bottomStat(
          Image.asset('assets/icons/Ammo.png'),
          '1000',
        ),
        const SizedBox(width: 5),
        _bottomStat(
          Image.asset('assets/icons/Lightning Bolt.png'),
          '1000',
        ),
        const SizedBox(width: 5),
        _bottomStat(
          Image.asset('assets/icons/Rabbit.png'),
          '1000',
        ),
        const SizedBox(width: 5),
        _bottomStat(
          const Icon(
            Icons.access_time_outlined,
            color: Colors.white,
            size: 16,
          ),
          '1000',
        ),
      ],
    );

Widget get _puzzleItem => ModeItem(
      title: 'Puzzle',
      subtitle: 'Train chess by solving puzzles',
      icon: Image.asset(
        'assets/icons/Chessboard.png',
        scale: 3,
      ),
      color: Colors.purple.shade700,
      stats: [
        _bottomStat(
          Container(),
          '1000',
        ),
      ],
    );

Widget get _computerItem => ModeItem(
      title: 'Play against the computer',
      subtitle: 'Play against Stockfish!',
      icon: Image.asset(
        'assets/icons/Bot.png',
        scale: 2.5,
      ),
      color: Colors.green.shade600,
    );

Widget get _friendsItem => ModeItem(
      title: 'Friends',
      subtitle: 'Play against your friends!',
      icon: const Icon(
        Icons.people,
        size: 35,
        color: Colors.white,
      ),
      color: Colors.deepOrange.shade700,
    );

Widget get _tournamentItem => ModeItem(
      title: 'Tournament',
      subtitle: 'Join a tournament!',
      icon: Image.asset(
        'assets/icons/Performance.png',
        scale: 2.5,
      ),
      color: Colors.lightBlue,
    );
Widget get _localItem => ModeItem(
      title: 'Over the board',
      subtitle: 'Play 1 vs 1 on the same device',
      icon: Transform.rotate(
        angle: math.pi / 2,
        child: const Icon(
          Icons.phone_android_rounded,
          size: 40,
          color: Colors.white,
        ),
      ),
      color: Colors.amber.shade700,
    );

Widget _bottomStat(Widget icon, String value) => Expanded(
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        decoration: BoxDecoration(
          color: lightDark,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 5),
            Expanded(
              child: AutoSizeText(
                value,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                maxFontSize: 12,
                minFontSize: 6,
              ),
            ),
          ],
        ),
      ),
    );
