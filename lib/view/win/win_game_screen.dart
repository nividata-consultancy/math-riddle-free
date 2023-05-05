import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:math_riddle/data/audio/audio_controller.dart';
import 'package:math_riddle/data/audio/sounds.dart';
import 'package:math_riddle/data/model/score.dart';
import 'package:math_riddle/view/common/common_filled_label_button_view.dart';
import 'package:math_riddle/view/neopop_button/constants.dart';
import 'package:provider/provider.dart';

class WinGameScreen extends HookWidget {
  final Score score;

  const WinGameScreen({
    super.key,
    required this.score,
  });

//0.20 //0.25

  @override
  Widget build(BuildContext context) {
    AnimationController animationController = useAnimationController();

    return Material(
      color: const Color.fromARGB(96, 12, 12, 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    color: const Color(0xff212121),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(40),
                    margin: const EdgeInsets.all(40),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Lottie.asset(
                          'assets/json/success-animation.json',
                          width: 120,
                          height: 120,
                          fit: BoxFit.fill,
                          repeat: false,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'You Won!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Roboto",
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Time: ${score.formattedTime}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto",
                          ),
                        ),
                        const SizedBox(height: 30),
                        CommonFilledLabelButtonView(
                          depth: kMediumButtonDepth,
                          label: "Continue".toUpperCase(),
                          height: 42,
                          fontSize: 16,
                          onPressed: () {
                            final audioController =
                                context.read<AudioController>();
                            audioController.playSfx(SfxType.buttonTap);
                            GoRouter.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              IgnorePointer(
                child: Transform.scale(
                  scale: 1.4,
                  child: Lottie.asset(
                    'assets/json/confetti-pop-small.json',
                    repeat: false,
                    controller: animationController,
                    onLoaded: (composition) {
                      animationController.duration = composition.duration;
                      Future.delayed(const Duration(milliseconds: 200), () {
                        animationController.forward();
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
