import 'package:flutter/material.dart';
import 'package:math_riddle/view/neopop_button/constants.dart';

/// A widget with [GestureDetector] that forms the basis of the [NeoPopButton].
class NeoPopButtonTranslator extends StatefulWidget {
  const NeoPopButtonTranslator({
    required this.child,
    this.depth = 3,
    this.animationDuration = kButtonDuration,
    required this.onPressed,
    this.onTapDown,
    this.onLongPress,
    this.forwardDuration,
    this.reverseDuration,
    super.key,
  });

  /// The child widget.
  final Widget child;

  /// The depth of the button.
  final double depth;

  /// The duration of the animation.
  final Duration animationDuration;

  /// The duration of the forward animation.
  final Duration? forwardDuration;

  /// The duration of the reverse animation.
  final Duration? reverseDuration;

  final VoidCallback onPressed;
  final VoidCallback? onTapDown;
  final VoidCallback? onLongPress;

  @override
  State<NeoPopButtonTranslator> createState() => _NeoPopButtonTranslatorState();
}

class _NeoPopButtonTranslatorState extends State<NeoPopButtonTranslator>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 1,
      // lowerBound: 0.0,
      // upperBound: 0.1,
      duration: widget.forwardDuration ??
          Duration(milliseconds: widget.animationDuration.inMilliseconds ~/ 2),
      reverseDuration: widget.reverseDuration ??
          Duration(milliseconds: widget.animationDuration.inMilliseconds ~/ 2),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double per = widget.depth / MediaQuery.of(context).size.width;

    return GestureDetector(
      onTapDown: (_) {
        widget.onTapDown?.call();
        controller.forward();
      },
      onTapUp: (_) {
        if (controller.isCompleted) {
          controller.reverse().whenComplete(() => widget.onPressed());
        } else {
          controller.forward().whenComplete(
                () =>
                    controller.reverse().whenComplete(() => widget.onPressed()),
              );
        }
      },
      onTapCancel: () => controller.reverse(),
      onLongPress: widget.onLongPress == null
          ? null
          : () {
              widget.onLongPress?.call();
              controller.forward();
            },
      onLongPressEnd: widget.onLongPress == null
          ? null
          : (_) {
              if (controller.isCompleted) {
                controller.reverse();
              } else {
                controller.forward().whenComplete(() => controller.reverse());
              }
            },
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          final double depth = 1 - per * controller.value;
          return Transform.scale(
            scale: depth,
            child: widget.child,
          );
        },
      ),
    );
  }
}
