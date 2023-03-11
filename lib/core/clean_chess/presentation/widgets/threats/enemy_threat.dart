import 'package:cleanchess/chess/abstractions/piece.dart';
import 'package:cleanchess/chess/core/utilities/defines.dart';
import 'package:cleanchess/chess/models/tuple.dart';
import 'package:flutter/material.dart';

class EnemyThreat extends StatelessWidget {
  const EnemyThreat({super.key, required this.threats});

  final Iterable<Tuple<Piece, int>> threats;

  @override
  Widget build(BuildContext context) => Column(
        children: threats
            .map(
              (threat) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      threat.first.imagePath,
                      scale: 9,
                    ),
                    Text(
                      threat.second.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: threat.second == 1
                            ? Colors.red
                            : threat.second == 2
                                ? Colors.orange
                                : Colors.amber,
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      );
}
