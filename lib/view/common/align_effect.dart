import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

@immutable
class AlignEffect extends Effect<Alignment> {
  static const Alignment neutralValue = Alignment.center;
  static const Alignment defaultValue = Alignment.topCenter;

  const AlignEffect({
    super.delay,
    super.duration,
    super.curve,
    super.begin = neutralValue,
    super.end = defaultValue,
  });

  @override
  Widget build(
    BuildContext context,
    Widget child,
    AnimationController controller,
    EffectEntry entry,
  ) {
    Animation<Alignment> animation = buildAnimation(controller, entry);
    return getOptimizedBuilder<Alignment>(
      animation: animation,
      builder: (_, __) {
        return Align(
          alignment: animation.value,
          child: child,
        );
      },
    );
  }
}
