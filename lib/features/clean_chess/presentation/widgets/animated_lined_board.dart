import 'package:flutter/material.dart';
import 'package:flutter_shared_tools/extensions/extensions.dart';

class AnimatedLinedBoard extends StatefulWidget {
  const AnimatedLinedBoard({super.key});

  @override
  State<AnimatedLinedBoard> createState() => _AnimatedLinedBoardState();
}

class _AnimatedLinedBoardState extends State<AnimatedLinedBoard>
    with TickerProviderStateMixin {
  Size get _boardSize => Size(
        MediaQuery.of(context).size.width * 0.8,
        MediaQuery.of(context).size.width * 0.8,
      );

  late final AnimationController _radiusController;
  late final Animation<double> _radiusTween;
  late final Animation<double> _blurTween;
  late final Animation<int> _centerLineLightningTween;
  late final Animation<int> _middleLineLightningTween;

  @override
  void dispose() {
    _radiusController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _radiusController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);

    _radiusTween = Tween<double>(
      begin: 0.48,
      end: 0.5,
    ).animate(
      CurvedAnimation(parent: _radiusController, curve: Curves.easeInOut),
    );
    _blurTween = Tween<double>(
      begin: 0.7,
      end: 0.85,
    ).animate(
      CurvedAnimation(parent: _radiusController, curve: Curves.easeInOut),
    );

    _centerLineLightningTween = IntTween(
      begin: 70,
      end: 140,
    ).animate(_radiusController);

    _middleLineLightningTween = IntTween(
      begin: 10,
      end: 20,
    ).animate(_radiusController);

    _radiusController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _radiusController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _radiusController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: _boardSize.width,
        height: _boardSize.height,
        child: AnimatedBuilder(
          animation: _radiusController,
          builder: (context, child) => ShaderMask(
            shaderCallback: (rect) => RadialGradient(
              colors: [
                context.primaryColor.withAlpha(_centerLineLightningTween.value),
                context.primaryColor.withAlpha(_middleLineLightningTween.value),
                Colors.transparent,
              ],
              radius: _radiusTween.value,
              stops: [0, _blurTween.value, 1],
            ).createShader(rect),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: _board(),
            ),
          ),
        ),
      );

  Widget _board() => Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                9,
                (index) => Container(
                  height: 1,
                  color: context.primaryColor,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                9,
                (index) => Container(
                  width: 1,
                  color: context.primaryColor,
                ),
              )
            ],
          ),
        ],
      );
}
