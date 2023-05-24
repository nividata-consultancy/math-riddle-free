import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:math_riddle/core/app_assets.dart';
import 'package:math_riddle/data/audio/audio_controller.dart';
import 'package:math_riddle/data/audio/sounds.dart';
import 'package:math_riddle/data/player_progress/player_progress.dart';
import 'package:math_riddle/data/puzzle/i_puzzle_repository.dart';
import 'package:math_riddle/data/setting/settings.dart';
import 'package:math_riddle/view/common/align_effect.dart';
import 'package:math_riddle/view/common/common_filled_label_button_view.dart';
import 'package:math_riddle/view/common/common_text_button_view.dart';
import 'package:math_riddle/view/neopop_button/constants.dart';
import 'package:provider/provider.dart';

class MainMenuScreen extends StatefulHookWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  MainMenuScreenState createState() => MainMenuScreenState();
}

class MainMenuScreenState extends State<MainMenuScreen> {
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   precacheImage(const AssetImage(AppAssets.bgMain), context).then((value) {
  //     FlutterNativeSplash.remove();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    useMemoized(() {
      AssetLottie('assets/json/success-animation.json').load();
    });
    useMemoized(() {
      AssetLottie('assets/json/confetti-pop-small.json').load();
    });

    final settingsController = context.watch<SettingsController>();
    final audioController = context.watch<AudioController>();
    final playerProgress = context.watch<PlayerProgress>();
    FlutterNativeSplash.remove();


    return Scaffold(
      body: Stack(
        children: [
          Animate(
            autoPlay: true,
            effects: [
              FadeEffect(
                delay: 1200.ms,
                duration: 1200.ms,
                curve: Curves.elasticOut,
              ),
              const MoveEffect(
                begin: Offset(0, 20),
                end: Offset(0, 0),
              ),
            ],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: Image.asset(
                    AppAssets.bgMain,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
          ),
          Animate(
            autoPlay: true,
            effects: [
              AlignEffect(
                delay: 1200.ms,
                duration: 1200.ms,
                curve: Curves.elasticOut,
              ),
              const ScaleEffect(
                begin: Offset(1, 1),
                end: Offset(0.8, 0.8),
              ),
            ],
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Image.asset(
                AppAssets.icAppLogo,
              ),
            ),
          ),
          Animate(
            autoPlay: true,
            effects: [
              FadeEffect(
                delay: 1200.ms,
                duration: 1200.ms,
                curve: Curves.elasticOut,
              ),
            ],
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // ValueListenableBuilder<bool>(
                  //   valueListenable: settingsController.muted,
                  //   builder: (context, muted, child) {
                  //     return IconButton(
                  //       onPressed: () {
                  //         audioController.playSfx(SfxType.iconButtonTap);
                  //         settingsController.toggleMuted();
                  //       },
                  //       icon: Icon(muted ? Icons.volume_off : Icons.volume_up),
                  //     );
                  //   },
                  // ),
                  ValueListenableBuilder<bool>(
                    valueListenable: settingsController.soundsOn,
                    builder: (context, soundsOn, child) => InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {
                        audioController.playSfx(SfxType.iconButtonTap);
                        settingsController.toggleSoundsOn();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          soundsOn ? Icons.graphic_eq : Icons.volume_off,
                        ),
                      ),
                    ),
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: settingsController.musicOn,
                    builder: (context, musicOn, child) => InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {
                        audioController.playSfx(SfxType.iconButtonTap);
                        settingsController.toggleMusicOn();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          musicOn ? Icons.music_note : Icons.music_off,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Animate(
            autoPlay: true,
            effects: [
              MoveEffect(
                delay: 1200.ms,
                duration: 1200.ms,
                curve: Curves.elasticOut,
                begin: const Offset(0, 150),
                end: const Offset(0, 0),
              ),
            ],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CommonFilledLabelButtonView(
                    depth: kButtonDepth,
                    label: "Play".toUpperCase(),
                    onPressed: () {
                      audioController.playSfx(SfxType.buttonTap);
                      if (playerProgress.highestLevelReached <
                          context
                              .read<IPuzzleRepository>()
                              .getGameLevelByOrder()
                              .length) {
                        GoRouter.of(context).go(
                            '/play/session/${playerProgress.highestLevelReached + 1}');
                      } else {
                        GoRouter.of(context).go('/play/session/1');
                      }
                    },
                  ),
                  _gap,
                  Row(
                    children: [
                      Expanded(
                        child: CommonTextButtonView(
                          label: "Levels".toUpperCase(),
                          height: 52,
                          fontWeight: FontWeight.w700,
                          onPressed: () {
                            audioController.playSfx(SfxType.buttonTap);
                            GoRouter.of(context).go('/play');
                          },
                        ),
                      ),
                    ],
                  ),
                  _gap,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static const _gap = SizedBox(height: 10);
}
