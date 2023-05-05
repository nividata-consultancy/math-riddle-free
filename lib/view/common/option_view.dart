import 'package:flutter/material.dart';
import 'package:math_riddle/data/audio/audio_controller.dart';
import 'package:math_riddle/data/audio/sounds.dart';
import 'package:math_riddle/data/model/option.dart';
import 'package:math_riddle/view/common/common_filled_button_view.dart';
import 'package:math_riddle/view/level/level_state.dart';
import 'package:provider/provider.dart';

class OptionView extends StatelessWidget {
  final List<Option> list;
  final void Function() onWrong;
  final void Function() onWin;
  final double height;

  const OptionView({
    super.key,
    required this.list,
    required this.onWrong,
    required this.onWin,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final audioController = context.read<AudioController>();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  ...list.take(list.length == 6 ? 3 : 2).map((e) {
                    return Expanded(
                      child: CommonFilledButtonView(
                        label: e.name,
                        height: height,
                        isSelected: e.isSelected,
                        onPressed: (value) {
                          audioController.playSfx(SfxType.click);
                          context
                              .read<LevelState>()
                              .onOptionSelection(option: e);
                        },
                      ),
                    );
                  }).toList()
                ],
              ),
              Row(
                children: [
                  ...list.skip(list.length == 6 ? 3 : 2).map((e) {
                    return Expanded(
                      child: CommonFilledButtonView(
                        label: e.name,
                        height: height,
                        isSelected: e.isSelected,
                        onPressed: (value) {
                          audioController.playSfx(SfxType.click);
                          context
                              .read<LevelState>()
                              .onOptionSelection(option: e);
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
          child: CommonFilledEnterButtonView(
            height: (height * 2) + 1,
            onPressed: () {
              audioController.playSfx(SfxType.click);
              bool isWin = context.read<LevelState>().evaluate();
              if (isWin) {
                onWin();
              } else {
                onWrong();
              }
            },
          ),
        ),
      ],
    );
  }
}
