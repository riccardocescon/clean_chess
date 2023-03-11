import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:cleanchess/core/presentation/widgets/fadein_animation_widget.dart';
import 'package:cleanchess/core/presentation/widgets/scale_animated_widget.dart';
import 'package:flutter/material.dart';

class LoginScreenChessboard extends StatefulWidget {
  const LoginScreenChessboard({
    super.key,
    required this.onOAuthStart,
  });

  final void Function() onOAuthStart;

  @override
  State<LoginScreenChessboard> createState() => _LoginScreenChessboardState();
}

class _LoginScreenChessboardState extends State<LoginScreenChessboard> {
  final int _animationDuration = 1000;

  bool _showPlayButton = false;
  final List<int> _highlightedCells = [26, 27, 28, 29, 34, 35, 36, 37];

  List<Widget> get _cells => List.generate(
        64,
        (index) => GestureDetector(
          onTap: _getOnTap(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOutCubic,
            decoration: BoxDecoration(
              color: _isButtonCell(index)
                  ? Colors.teal.shade300
                  : getCellColor(index),
              borderRadius: _getBorderRadius(index),
            ),
          ),
        ),
      );

  void Function() _getOnTap(int index) {
    if (_isButtonCell(index)) {
      return () => widget.onOAuthStart();
    } else {
      return () {};
    }
  }

  bool _isButtonCell(int index) =>
      _highlightedCells.contains(index) && _showPlayButton;

  BorderRadiusGeometry _getBorderRadius(int index) {
    if (!_showPlayButton) return const BorderRadius.all(Radius.circular(0));
    if (index == 26) {
      return const BorderRadius.only(
        topLeft: Radius.circular(20),
      );
    } else if (index == 29) {
      return const BorderRadius.only(
        topRight: Radius.circular(20),
      );
    } else if (index == 34) {
      return const BorderRadius.only(
        bottomLeft: Radius.circular(20),
      );
    } else if (index == 37) {
      return const BorderRadius.only(
        bottomRight: Radius.circular(20),
      );
    } else {
      return BorderRadius.zero;
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1500)).then(
      (value) => setState(() {
        _showPlayButton = true;
      }),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleAnimatedWidet(
      animationDurationMs: _animationDuration,
      switchInCurve: Curves.easeInOutCubic,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: double.maxFinite,
          child: AspectRatio(
            aspectRatio: 1,
            child: Stack(
              alignment: Alignment.center,
              children: [
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 8,
                  children: List.generate(
                    _cells.length,
                    (index) => _cells[index],
                  ),
                ),
                IgnorePointer(
                  child: Visibility(
                    visible: _showPlayButton,
                    child: const FadeInAnimatedWidet(
                      offsetDurationMs: 100,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
