import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FailedIcon extends StatefulWidget {
  const FailedIcon({super.key});

  @override
  State<FailedIcon> createState() => _FailedIconState();
}

class _FailedIconState extends State<FailedIcon> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 80, end: 50).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,
      ),
    );
    _controller.forward();
  }

  // calculate alpha where 80 is the start value and 50 is the end value
  // and the alpha lerps between 0 and 255
  int get alpha => (255 * (1 - (_animation.value - 50) / (80 - 50))).toInt();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, __) {
        return Icon(
          Icons.close_rounded,
          size: _animation.value,
          color: Colors.red.withAlpha(alpha),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
