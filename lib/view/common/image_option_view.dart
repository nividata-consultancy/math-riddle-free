import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:math_riddle/data/audio/audio_controller.dart';
import 'package:math_riddle/data/audio/sounds.dart';
import 'package:math_riddle/data/model/image_option.dart';
import 'package:math_riddle/data/model/option.dart';
import 'package:math_riddle/view/common/common_filled_button_view.dart';
import 'package:math_riddle/view/common/common_image_button_view.dart';
import 'package:math_riddle/view/level/level_state.dart';
import 'package:provider/provider.dart';

class ImageOptionView extends StatelessWidget {
  final List<Option> list;
  final void Function() onWrong;
  final void Function() onWin;
  final double height;

  const ImageOptionView({
    super.key,
    required this.list,
    required this.onWrong,
    required this.onWin,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final audioController = context.read<AudioController>();

    return Column(
      children: [
        Row(
          children: [
            ...list.mapIndexed((i, e) {
              return Expanded(
                child: CommonImageButtonView(
                  imageOption: e as ImageOption,
                  index: i,
                  selectedList: list.map((e) => e.isSelected).toList(),
                  onPressed: (option) {
                    audioController.playSfx(SfxType.click);
                    context
                        .read<LevelState>()
                        .onOptionSelection(option: option);
                  },
                ),
              );
            }).toList()
          ],
        ),
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
      ],
    );
  }
}
