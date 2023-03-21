import 'package:cleanchess/core/clean_chess/presentation/widgets/homepage_mode_items.dart'
    as homepage_mode_items;
import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/homepage_appbar.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _customScrollView(
          children: [
            _paddedItems(
              [
                const HomepageAppbar(),
                //TODO: @alexrintt's slidebar
                _modesList(),
                heigth5,
                _onlineInfo(),
                heigth5,
                _liveStreamingText(),
                heigth10,
                _streamingSection(),
                heigth20,
                _dailyPuzzleSection(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _paddedItems(List<Widget> children) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: children,
        ),
      );

  Widget _customScrollView({required List<Widget> children}) =>
      CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(children),
          ),
        ],
      );

  Widget _modesList() => SizedBox(
        height: modeItemHeigth * 3,
        child: ListView.builder(
          // itemCount: homepage_mode_items.playModes.length,
          // itemBuilder: (context, index) => homepage_mode_items.playModes[index],

          // itemCount: homepage_mode_items.learnModes.length,
          // itemBuilder: (context, index) =>
          //     homepage_mode_items.learnModes[index],

          // itemCount: homepage_mode_items.toolsModes.length,
          // itemBuilder: (context, index) =>
          //     homepage_mode_items.toolsModes[index],

          itemCount: homepage_mode_items.communityModes.length,
          itemBuilder: (context, index) =>
              homepage_mode_items.communityModes[index],
        ),
      );

  Widget _dailyPuzzleSection() => Column(
        children: const [
          AspectRatio(
            aspectRatio: 1,
            child: Placeholder(),
          ),
        ],
      );

  Widget _streamingSection() => Column(
        children: [
          _paddedItems([
            _streamingUserItem(
              isWhite: false,
              title: 'IM',
              color: Colors.amber,
              name: 'Riccardo Cescon',
              elo: '2829',
              time: '0:22',
            ),
          ]),
          heigth5,
          const AspectRatio(
            aspectRatio: 1,
            child: Placeholder(),
          ),
          heigth5,
          _paddedItems(
            [
              _streamingUserItem(
                isWhite: true,
                title: 'GM',
                color: Colors.pink,
                name: 'Hardal',
                elo: '3018',
              ),
            ],
          ),
        ],
      );

  Widget _streamingUserItem({
    required bool isWhite,
    required String title,
    required Color color,
    required String name,
    required String elo,
    String? time,
  }) =>
      Row(
        children: [
          _teamColorItem(isWhite),
          const SizedBox(width: 10),
          _titleItem(title, color),
          const SizedBox(width: 5),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            elo,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withAlpha(50),
              fontWeight: FontWeight.bold,
            ),
          ),
          //TODO: add flag icon
          const Spacer(),
          if (time != null)
            Text(
              time,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.pink,
                fontWeight: FontWeight.bold,
              ),
            )
        ],
      );

  Widget _titleItem(String title, Color color) => Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: color,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _teamColorItem(bool isWhite) => CircleAvatar(
        backgroundColor: Colors.white,
        radius: 14,
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Image.asset(
            isWhite
                ? 'assets/pieces/flat/white_pawn.png'
                : 'assets/pieces/flat/black_pawn.png',
          ),
        ),
      );

  Widget _onlineInfo() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _text('100.000 Players'),
          _text('50.000 Games'),
        ],
      );

  Widget _liveStreamingText() => Column(
        children: [
          Column(
            children: [
              const SizedBox(width: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.pink,
                    radius: 5,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Live',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                'Streaming right now',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withAlpha(50),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      );

  Widget _text(String text) => Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );
}
