import 'package:flutter/material.dart';
import 'package:math_riddle/data/audio/audio_controller.dart';
import 'package:math_riddle/data/audio/sounds.dart';
import 'package:math_riddle/view/common/common_filled_button_view.dart';
import 'package:math_riddle/view/common/common_input_text_view.dart';
import 'package:math_riddle/view/level/level_state.dart';
import 'package:provider/provider.dart';

class NumPadView extends StatelessWidget {
  final void Function() onWrong;
  final void Function() onWin;
  final double height;

  const NumPadView({
    super.key,
    required this.onWrong,
    required this.onWin,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final audioController = context.read<AudioController>();
    return Column(
      children: [
        Selector<LevelState, String>(
          selector: (p0, p1) => p1.input,
          builder: (context, value, child) {
            return CommonInputTextView(
              value: value,
              height: height,
            );
          },
        ),
        Row(
          children: [
            Expanded(
              flex: 10,
              child: Column(
                children: [
                  Row(
                    children: [
                      ...["1", "2", "3", "4", "5"].map((e) {
                        return Expanded(
                          flex: 2,
                          child: CommonFilledButtonView(
                            label: e,
                            height: height,
                            onPressed: (value) {
                              audioController.playSfx(SfxType.click);
                              context.read<LevelState>().onTextChange(value);
                            },
                          ),
                        );
                      }).toList()
                    ],
                  ),
                  Row(
                    children: [
                      ...["6", "7", "8", "9", "0"].map((e) {
                        return Expanded(
                          flex: 2,
                          child: CommonFilledButtonView(
                            label: e,
                            height: height,
                            onPressed: (value) {
                              audioController.playSfx(SfxType.click);
                              context.read<LevelState>().onTextChange(value);
                            },
                          ),
                        );
                      }).toList()
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CommonFilledEnterButtonView(
                          onPressed: () {
                            audioController.playSfx(SfxType.click);
                            bool isWin = context.read<LevelState>().evaluate();
                            if (isWin) {
                              onWin();
                            } else {
                              onWrong();
                            }
                          },
                          height: height,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CommonFilledBackButtonView(
                          onPressed: () {
                            audioController.playSfx(SfxType.clickBack);
                            context.read<LevelState>().onBackSpace();
                          },
                          height: height,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
