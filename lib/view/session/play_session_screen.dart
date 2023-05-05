import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart' hide Level;
import 'package:math_riddle/core/app_colors.dart';
import 'package:math_riddle/core/app_constant.dart';
import 'package:math_riddle/data/audio/audio_controller.dart';
import 'package:math_riddle/data/audio/sounds.dart';
import 'package:math_riddle/data/model/base_level.dart';
import 'package:math_riddle/data/model/option.dart';
import 'package:math_riddle/data/model/score.dart';
import 'package:math_riddle/data/player_progress/player_progress.dart';
import 'package:math_riddle/data/puzzle/i_puzzle_repository.dart';
import 'package:math_riddle/view/common/common_scaffold_view.dart';
import 'package:math_riddle/view/common/image_option_view.dart';
import 'package:math_riddle/view/common/numpad_view.dart';
import 'package:math_riddle/view/common/option_view.dart';
import 'package:math_riddle/view/hint/hint_screen.dart';
import 'package:math_riddle/view/level/level_state.dart';
import 'package:math_riddle/view/win/win_game_screen.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:wakelock/wakelock.dart';

class PlaySessionScreen extends StatelessWidget {
  final int id;

  const PlaySessionScreen(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    IPuzzleRepository puzzleRepository = context.read<IPuzzleRepository>();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LevelState(
            id: id,
            puzzleRepository: puzzleRepository,
          ),
        ),
      ],
      child: LevelStateScreen(
        id,
        puzzleRepository,
      ),
    );
  }
}

class LevelStateScreen extends StatefulWidget {
  final int id;
  final IPuzzleRepository puzzleRepository;

  const LevelStateScreen(this.id, this.puzzleRepository, {super.key});

  @override
  State<LevelStateScreen> createState() => _LevelStateScreenState();
}

class _LevelStateScreenState extends State<LevelStateScreen> {
  static final _log = Logger('LevelStateScreen');

  static const _celebrationDuration = Duration(milliseconds: 400);

  static const _preCelebrationDuration = Duration(milliseconds: 50);

  late DateTime _startOfPlay;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    _startOfPlay = DateTime.now();
    Wakelock.enable();
  }

  @override
  void dispose() {
    Wakelock.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldView(
      title: Selector<LevelState, int>(
        selector: (p0, p1) => p1.level.id,
        builder: (context, value, child) {
          return Text("Level $value");
        },
      ),
      actions: [
        Selector<LevelState, String>(
          selector: (p0, p1) => p1.level.hint,
          builder: (context, value, child) {
            return value.isEmpty
                ? const SizedBox()
                : IconButton(
                    icon: const Icon(Icons.help_outline),
                    onPressed: () async {
                      final audioController = context.read<AudioController>();
                      audioController.playSfx(SfxType.iconButtonTap);
                      await showDialog<void>(
                        context: context,
                        builder: (context) {
                          return HintScreen(hint: value);
                        },
                      );
                    },
                  );
          },
        ),
      ],
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Selector<LevelState, Tuple2<int, String>>(
                    selector: (p0, p1) {
                      return Tuple2(p1.level.id, p1.level.question);
                    },
                    builder: (context, value, child) {
                      return Text(
                        key: ValueKey(value),
                        "${value.item2}\n",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          height: 1.1,
                        ),
                      ).animate(key: ValueKey(value.item1)).fade().scaleX(
                            begin: .5,
                            end: 1,
                            curve: Curves.easeOutBack,
                            duration: 600.milliseconds,
                          );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Selector<LevelState, Tuple2<int, String>>(
                      selector: (p0, p1) {
                        return Tuple2(p1.level.id, p1.level.image);
                      },
                      builder: (context, value, child) {
                        return Image.asset(
                          key: ValueKey(value),
                          value.item2,
                        ).animate(key: ValueKey(value.item1)).fade()
                          ..scaleXY(
                            begin: 0.5,
                            end: 1,
                            curve: Curves.easeOutBack,
                            duration: 600.milliseconds,
                          );
                      },
                    )
                        .animate(
                          autoPlay: false,
                          onInit: (controller) {
                            animationController = controller;
                          },
                        )
                        .shimmer(
                          duration: 1000.ms,
                          color: AppColor.red,
                        ) // shimmer +
                        .shake(hz: 4, curve: Curves.easeInOutCubic) // shake +
                        .scaleXY(
                          begin: 1,
                          end: 0.9,
                          duration: 400.ms,
                        ) // scale up
                        .then(delay: 200.ms) // then wait and
                        .scaleXY(
                          begin: 0.9,
                          end: 1,
                          duration: 400.ms,
                        ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
          LayoutBuilder(builder: (context, constraints) {
            double height = (constraints.maxWidth / 7.5);
            return SizedBox(
              height: (height * 3) + 2,
              child: Selector<LevelState, Tuple2<BaseLevel, List<Option>>>(
                selector: (p0, p1) => Tuple2(p1.level, p1.optionList),
                builder: (context, value, child) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 900),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        key: ValueKey<Key?>(child.key),
                        opacity: animation,
                        child: SlideTransition(
                          position: Tween(
                            begin: const Offset(0.0, 1.0),
                            end: const Offset(0.0, 0.0),
                          ).animate(animation),
                          child: child,
                        ),
                      );
                    },
                    child: (value.item1.gameType == GameType.numpad)
                        ? NumPadView(
                            key: const ValueKey(GameType.numpad),
                            onWin: _playerWon,
                            onWrong: _playerWrong,
                            height: height,
                          )
                        : (value.item1.gameType == GameType.option
                            ? OptionView(
                                key: const ValueKey(GameType.option),
                                list: value.item2,
                                onWin: _playerWon,
                                onWrong: _playerWrong,
                                height: height,
                              )
                            : ImageOptionView(
                                key: const ValueKey(GameType.imageOption),
                                list: value.item2,
                                onWin: _playerWon,
                                onWrong: _playerWrong,
                                height: height,
                              )),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }

  Future<void> _playerWon() async {
    BaseLevel level = context.read<LevelState>().level;
    _log.info('Level ${level.id} won');

    final score = Score(
      level.id,
      level.difficulty,
      DateTime.now().difference(_startOfPlay),
    );

    final playerProgress = context.read<PlayerProgress>();
    playerProgress.setLevelReached(level.id);

    // Let the player see the game just after winning for a bit.
    await Future<void>.delayed(_preCelebrationDuration);
    if (!mounted) return;

    final audioController = context.read<AudioController>();
    audioController.playSfx(SfxType.congrats);

    if (!mounted) return;
    await showDialog<void>(
      context: context,
      builder: (context) {
        return WinGameScreen(score: score);
      },
    );
    await Future<void>.delayed(_celebrationDuration);
    if (mounted) {
      if (level.id + 1 <
          widget.puzzleRepository.getGameLevelByOrder().length + 1) {
        _startOfPlay = DateTime.now();
        context.read<LevelState>().levelUp(newId: level.id + 1);
      } else {
        GoRouter.of(context).pop();
      }
    }
  }

  Future<void> _playerWrong() async {
    animationController.forward(from: 0);
    BaseLevel level = context.read<LevelState>().level;
    _log.info('Level ${level.id} wrong');

    if (!mounted) return;

    final audioController = context.read<AudioController>();
    audioController.playSfx(SfxType.wrong);
  }
}
