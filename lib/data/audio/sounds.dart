List<String> soundTypeToFilename(SfxType type) {
  switch (type) {
    case SfxType.click:
      return const [
        '1_click.wav',
      ];
    case SfxType.clickBack:
      return const [
        '1_click_back.wav',
      ];
    case SfxType.wrong:
      return const [
        '1_wrong.mp3',
      ];

    case SfxType.buttonTap:
      return const [
        '1_transition.wav',
      ];
    case SfxType.iconButtonTap:
      return const [
        '1_ball.wav',
      ];
    case SfxType.congrats:
      return const ["1_win.mp3"];
  }
}

/// Allows control over loudness of different SFX types.
double soundTypeToVolume(SfxType type) {
  switch (type) {
    case SfxType.buttonTap:
    case SfxType.iconButtonTap:
    case SfxType.wrong:
    case SfxType.click:
    case SfxType.clickBack:
    case SfxType.congrats:
      return 1.0;
  }
}

enum SfxType {
  click,
  clickBack,
  wrong,
  buttonTap,
  iconButtonTap,
  congrats,
}
