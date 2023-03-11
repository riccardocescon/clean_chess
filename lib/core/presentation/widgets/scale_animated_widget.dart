import 'package:flutter/material.dart';

class ScaleAnimatedWidet extends StatefulWidget {
  const ScaleAnimatedWidet({
    super.key,
    required this.child,
    this.size = 100,
    this.animationDurationMs = 500,
    this.offsetDurationMs = 500,
    this.switchInCurve = Curves.easeInOutCubic,
    this.switchOutCurve = Curves.easeInOutCubic,
  });

  /// The final size of the logo
  final double size;

  /// The duration of the animation in milliseconds
  final int animationDurationMs;

  /// The duration before the animation starts in milliseconds
  final int offsetDurationMs;

  /// The curve of the animation when the logo is shown
  final Curve switchInCurve;

  /// The curve of the animation when the logo is hidden
  final Curve switchOutCurve;

  /// The widget that will be shown after the animation
  final Widget child;

  @override
  State<ScaleAnimatedWidet> createState() => _ScaleAnimatedWidetState();
}

class _ScaleAnimatedWidetState extends State<ScaleAnimatedWidet> {
  bool _showLogo = false;

  @override
  void initState() {
    Future.delayed(
      Duration(milliseconds: widget.offsetDurationMs),
      () => setState(() {
        _showLogo = true;
      }),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
        duration: Duration(milliseconds: widget.animationDurationMs),
        transitionBuilder: (child, animation) => ScaleTransition(
          scale: animation,
          child: child,
        ),
        switchInCurve: widget.switchInCurve,
        switchOutCurve: widget.switchOutCurve,
        child: _showLogo ? widget.child : Container(),
      );
}
