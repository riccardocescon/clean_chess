import 'package:auto_size_text/auto_size_text.dart';
import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:cleanchess/core/utilities/enum_themes.dart';
import 'package:cleanchess/features/clean_chess/presentation/pages/puzzle_page.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/animated_board_piece.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/mode_item_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

// Modes available in the pre-release.
List<Widget> preReleaseModes(
  BuildContext context,
  String Function() onUserId,
) =>
    [
      _quickMatchItem,
      _puzzleItem(
        context,
        onUserId,
      ),
      _computerItem,
    ];

List<Widget> playModes(
  BuildContext context,
  String Function() onUserId,
  PieceAnimation Function() onGetPieceAnimation,
  BoardTheme Function() onGetBoardTheme,
) =>
    [
      _quickMatchItem,
      _puzzleItem(
        context,
        onUserId,
      ),
      _computerItem,
      _friendsItem,
      _tournamentItem,
      _localItem,
    ];

List<Widget> get learnModes => [
      _tactisItem,
      _studyItem,
      _coordsItem,
      _watchItem,
    ];

List<Widget> toolsModes = [
  _analysisItem,
  _boardEditorItem,
  _clockItem,
  _importGameItem,
];

List<Widget> communityModes = [
  _searchItem,
  _leaderboardItem,
  _usersItem,
];

//#region Play modes
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

Widget _puzzleItem(
  BuildContext context,
  String Function() onUserId,
) =>
    ModeItem(
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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PuzzlePage(
              userId: onUserId(),
            ),
          ),
        );
      },
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

//#endregion

//#region Learn modes
Widget get _tactisItem => const ModeItem(
      title: 'Tactics',
      subtitle: 'Learn chess tactis',
      icon: Icon(
        Icons.lightbulb,
        size: 35,
        color: Colors.white,
      ),
      color: Colors.teal,
    );
Widget get _studyItem => const ModeItem(
      title: 'Studies',
      subtitle: 'Learn the art of chess',
      icon: Icon(
        Icons.menu_book_rounded,
        size: 35,
        color: Colors.white,
      ),
      color: Colors.indigo,
    );
Widget get _coordsItem => const ModeItem(
      title: 'Coordinates',
      subtitle: 'Never get lost again!',
      icon: Icon(
        Icons.public,
        size: 35,
        color: Colors.white,
      ),
      color: Colors.pink,
    );
Widget get _watchItem => ModeItem(
      title: 'Watch',
      subtitle: 'Watch high ranked players',
      icon: Image.asset(
        'assets/icons/Vision.png',
        scale: 2.5,
        color: Colors.black,
      ),
      color: Colors.lime,
    );

//#endregion

//#region Tools modes
Widget get _analysisItem => ModeItem(
      title: 'Analysis',
      subtitle: 'Analyse your games',
      icon: Image.asset(
        'assets/icons/Financial Growth Analysis.png',
        scale: 2.5,
        color: Colors.white,
      ),
      color: Colors.green.shade700,
    );
Widget get _boardEditorItem => ModeItem(
      title: 'Board Editor',
      subtitle: 'Edit the board',
      icon: const Icon(
        Icons.edit,
        size: 35,
        color: Colors.white,
      ),
      color: Colors.orange.shade700,
    );
Widget get _clockItem => ModeItem(
      title: 'Clock',
      subtitle: 'Start a chess clock',
      icon: const Icon(
        Icons.alarm,
        size: 35,
        color: Colors.white,
      ),
      color: Colors.purple.shade700,
    );
Widget get _importGameItem => ModeItem(
      title: 'Import Game',
      subtitle: 'Import your games',
      icon: const Icon(
        Icons.upload_file_rounded,
        size: 35,
        color: Colors.white,
      ),
      color: Colors.blue.shade600,
    );
//#endregion

//#region Community modes
Widget get _searchItem => ModeItem(
      title: 'Search',
      subtitle: 'Search for users and games',
      icon: const Icon(
        Icons.search,
        size: 35,
        color: Colors.white,
      ),
      color: Colors.red.shade600,
    );
Widget get _leaderboardItem => ModeItem(
      title: 'Leaderboard',
      subtitle: 'View the leaderboard',
      icon: const Icon(
        Icons.leaderboard,
        size: 35,
        color: Colors.white,
      ),
      color: Colors.purple.shade600,
    );
Widget get _usersItem => const ModeItem(
      title: 'Users',
      subtitle: 'Searh for users',
      icon: Icon(
        Icons.groups,
        size: 35,
        color: Colors.white,
      ),
      color: Colors.teal,
    );

//#endregion

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
