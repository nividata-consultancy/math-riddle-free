import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:math_riddle/data/audio/audio_controller.dart';
import 'package:math_riddle/data/audio/sounds.dart';
import 'package:math_riddle/view/common/common_filled_label_button_view.dart';
import 'package:math_riddle/view/neopop_button/constants.dart';
import 'package:provider/provider.dart';

class HintScreen extends StatelessWidget {
  final String hint;

  const HintScreen({
    super.key,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(96, 12, 12, 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: const Color(0xff212121),
            alignment: Alignment.center,
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Hint',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Roboto",
                  ),
                ),
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    hint,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: CommonFilledLabelButtonView(
                    depth: kMediumButtonDepth,
                    label: "Ok".toUpperCase(),
                    height: 42,
                    fontSize: 16,
                    onPressed: () {
                      final audioController = context.read<AudioController>();
                      audioController.playSfx(SfxType.buttonTap);
                      GoRouter.of(context).pop();
                    },
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
