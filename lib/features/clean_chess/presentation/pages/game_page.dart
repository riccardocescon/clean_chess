import 'package:cleanchess/features/clean_chess/presentation/widgets/chessboard_interpreter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shared_tools/extensions/extensions.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Game'),
        ),
        body: _body(),
      ),
    );
  }

  Widget _body() => SizedBox(
        height: context.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            AspectRatio(
              aspectRatio: 1,
              child: ChessboardInterpreter(),
            ),
          ],
        ),
      );
}
