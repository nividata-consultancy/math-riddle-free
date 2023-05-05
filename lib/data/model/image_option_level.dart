import 'package:math_riddle/core/app_constant.dart';
import 'package:math_riddle/data/model/option_level.dart';

class ImageOptionLevel extends OptionLevel {
  const ImageOptionLevel({
    required super.id,
    super.gameType = GameType.imageOption,
    required super.difficulty,
    required super.question,
    super.hint,
    required super.image,
    required super.answer,
    required super.optionList,
  });
}
