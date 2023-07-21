import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:math_riddle/core/app_constant.dart';
import 'package:math_riddle/data/audio/audio_controller.dart';
import 'package:math_riddle/data/audio/sounds.dart';
import 'package:provider/provider.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

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
                const SizedBox(height: 24),
                Text(
                  'language'.tr(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Roboto",
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: context.supportedLocales
                        .map(
                          (e) => TextButton(
                            onPressed: () {
                              final audioController =
                                  context.read<AudioController>();
                              audioController.playSfx(SfxType.iconButtonTap);
                              EasyLocalization.of(context)?.setLocale(e);
                              Navigator.of(context).pop();
                            },
                            child: Row(
                              children: [
                                const SizedBox(width: 8),
                                Text(
                                  languageList
                                      .firstWhere(
                                          (element) => element.locale == e)
                                      .flag,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  languageList
                                      .firstWhere(
                                          (element) => element.locale == e)
                                      .name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                                const Spacer(),
                                if (context.locale == e)
                                  const Icon(Icons.check_box),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
