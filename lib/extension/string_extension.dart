import 'package:math_riddle/data/model/image_option.dart';

extension ImagePathExtension on int {
  String toImagePath() {
    return "assets/images/puzzle/game_puzzle_$this.png";
  }

  String toOptionImagePath({required String type}) {
    return "assets/images/puzzle/game_puzzle_${this}_option_$type.png";
  }

  List<ImageOption> toAbcdOptionImagePath() {
    return [
      ImageOption(
        name: "A",
        image: toOptionImagePath(type: "a"),
      ),
      ImageOption(
        name: "B",
        image: toOptionImagePath(type: "b"),
      ),
      ImageOption(
        name: "C",
        image: toOptionImagePath(type: "c"),
      ),
      ImageOption(
        name: "D",
        image: toOptionImagePath(type: "d"),
      ),
    ];
  }
}
