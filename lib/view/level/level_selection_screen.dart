import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:math_riddle/core/app_colors.dart';
import 'package:math_riddle/data/audio/audio_controller.dart';
import 'package:math_riddle/data/audio/sounds.dart';
import 'package:math_riddle/data/player_progress/player_progress.dart';
import 'package:math_riddle/data/puzzle/i_puzzle_repository.dart';
import 'package:math_riddle/view/common/common_filled_label_button_view.dart';
import 'package:math_riddle/view/common/common_scaffold_view.dart';
import 'package:math_riddle/view/neopop_button/constants.dart';
import 'package:provider/provider.dart';

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final playerProgress = context.watch<PlayerProgress>();
    final puzzleRepository = context.read<IPuzzleRepository>();
    final list = puzzleRepository.getGameLevelByOrder();

    return CommonScaffoldView(
      title: Text("levels".tr()),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          childAspectRatio: 1,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return CommonFilledLabelButtonView(
            depth: kSmallButtonDepth,
            isLevels: true,
            label: "${list[index].position}",
            fontSize: 16,
            textColor:
                playerProgress.highestLevelReached <= list[index].position - 1
                    ? AppColor.white
                    : AppColor.black,
            color:
                playerProgress.highestLevelReached <= list[index].position - 1
                    ? AppColor.blue
                    : AppColor.white,
            onPressed:
                playerProgress.highestLevelReached >= list[index].position - 1
                    ? () {
                        final audioController = context.read<AudioController>();
                        audioController.playSfx(SfxType.buttonTap);

                        GoRouter.of(context)
                            .go('/play/session/${list[index].position}');
                      }
                    : null,
          );
        },
      ),
    );
  }
}
