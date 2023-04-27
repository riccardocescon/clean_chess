import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:flutter/material.dart';

class PuzzleHintButton extends StatefulWidget {
  const PuzzleHintButton({
    super.key,
    required this.onHintPressed,
    required this.onGetNextMove,
    required this.onGetHintCell,
    required this.onForceUserMove,
  });

  final void Function() onHintPressed;
  final String Function() onGetNextMove;
  final void Function(String) onGetHintCell;
  final void Function(String) onForceUserMove;

  @override
  State<PuzzleHintButton> createState() => _PuzzleHintButtonState();
}

class _PuzzleHintButtonState extends State<PuzzleHintButton> {
  _HintMove _hintMove = _HintMove.highlight;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        widget.onHintPressed();
        // _hintCount++;
        if (_hintMove == _HintMove.highlight) {
          // _controller.highLightHintCell(_puzzle!.moves.first);
          widget.onGetHintCell(widget.onGetNextMove());
          setState(() {
            _hintMove = _HintMove.reveal;
          });
        } else {
          final move = widget.onGetNextMove();
          widget.onForceUserMove(move);
          // _controller.forceUserMove(move);
          setState(() {
            _hintMove = _HintMove.highlight;
          });
        }
      },
      splashColor: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.tips_and_updates_rounded,
          ),
          width10,
          Text(_hintMove.message),
        ],
      ),
    );
  }
}

enum _HintMove {
  highlight('Show next move'),
  reveal('Reveal move');

  const _HintMove(this.message);

  final String message;
}
