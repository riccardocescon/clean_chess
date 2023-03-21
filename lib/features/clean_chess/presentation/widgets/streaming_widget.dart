import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/padded_items.dart';
import 'package:flutter/material.dart';

class StreamingWidget extends StatelessWidget {
  const StreamingWidget({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          PaddedItems(children: [
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
          PaddedItems(
            children: [
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
}
