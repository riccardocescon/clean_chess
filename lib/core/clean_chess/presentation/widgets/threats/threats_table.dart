import 'package:cleanchess/chess/abstractions/piece.dart';
import 'package:cleanchess/chess/core/utilities/assets.dart';
import 'package:cleanchess/chess/models/tuple.dart';
import 'package:cleanchess/core/clean_chess/presentation/widgets/threats/enemy_threat.dart';
import 'package:flutter/material.dart';

class ThreatsTable extends StatelessWidget {
  const ThreatsTable({
    super.key,
    required this.whiteThreats,
    required this.blackThreats,
  });

  final Iterable<Tuple<Piece<dynamic>, int>> whiteThreats;
  final Iterable<Tuple<Piece<dynamic>, int>> blackThreats;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    flatWhiteKing,
                    scale: 7,
                  ),
                  EnemyThreat(threats: whiteThreats),
                ],
              ),
            ),
            Container(
              width: 1,
              height: MediaQuery.of(context).size.height * 0.5,
              color: Colors.white,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    flatBlackKing,
                    scale: 7,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  EnemyThreat(threats: blackThreats),
                ],
              ),
            ),
          ],
        ),
      );
}
