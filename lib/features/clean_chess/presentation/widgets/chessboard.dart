import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:flutter/material.dart';

class Chessboard extends StatelessWidget {
  const Chessboard({super.key});

  @override
  Widget build(BuildContext context) => GridView.builder(
        itemCount: 64,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) => SizedBox(
          height: 3,
          width: 3,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: getCellColor(index),
            ),
          ),
        ),
      );
}
