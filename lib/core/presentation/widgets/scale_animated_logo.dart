import 'package:cleanchess/core/presentation/widgets/scale_animated_widget.dart';
import 'package:flutter/material.dart';
import 'package:cleanchess/chess/core/utilities/assets.dart' as assets;

class ScaleAnimatedLogo extends StatelessWidget {
  const ScaleAnimatedLogo({
    super.key,
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

  @override
  Widget build(BuildContext context) => ScaleAnimatedWidet(
        size: size,
        animationDurationMs: animationDurationMs,
        offsetDurationMs: offsetDurationMs,
        switchInCurve: switchInCurve,
        switchOutCurve: switchOutCurve,
        child: Image.asset(
          assets.logo,
          width: size,
          height: size,
        ),
      );
}
