import 'package:cleanchess/features/clean_chess/presentation/widgets/glitch_clipper.dart';
import 'package:flutter/material.dart';

class GlitchTransition extends AnimatedWidget {
  const GlitchTransition({
    super.key,
    required Animation<double> effect,
    this.effectMultiplier = 400,
    this.child,
  }) : super(listenable: effect);

  final Widget? child;

  // [GlitchAnimation] needs a [seed] that is an [int] that rapresent how many
  // squares to show in the animation.
  // Less squares == Less widget to build
  // More suqares == More widget to build
  // Since [effect] is a [Tween<double>] that goes from 0 to 1, we need to
  // multiply it by a number to get a number that rapresent the number of
  // squares to show.
  final double effectMultiplier;

  Animation<double> get effect => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    bool isGlitching = effect.value > 0 && effect.value < 1;
    int seed = isGlitching
        ? (effect.value * effectMultiplier).toInt()
        : GlitchClipper.noEffect;
    return ClipPath(
      clipper: GlitchClipper(seed),
      child: child,
    );
  }
}
