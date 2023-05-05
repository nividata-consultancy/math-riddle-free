import 'package:collection/collection.dart';
import 'package:math_riddle/core/app_constant.dart';
import 'package:math_riddle/data/model/base_level.dart';
import 'package:math_riddle/data/model/image_option_level.dart';
import 'package:math_riddle/data/model/option_level.dart';
import 'package:math_riddle/data/puzzle/i_puzzle_repository.dart';
import 'package:math_riddle/extension/list_extension.dart';
import 'package:math_riddle/extension/string_extension.dart';

class ProPuzzleRepository extends IPuzzleRepository {
  @override
  List<BaseLevel> getGameLevelByOrder() {
    return getGameLevel()
        .orderByAnotherList(
          getLevelOrder(),
          (p0) => p0.id,
        )
        .mapIndexed((i, e) => e.copyWith(id: i + 1))
        .toList();
  }

  @override
  List<BaseLevel> getGameLevel() {
    return [
      BaseLevel(
        id: 100,
        difficulty: 5,
        question: "Can you find the missing number?",
        hint: "Add the previous sum to next question.",
        image: 100.toImagePath(),
        answer: "40",
      ),
      OptionLevel(
        id: 104,
        difficulty: 5,
        question: "Which is the odd one out?",
        hint: "Focus on shape and color.",
        image: 104.toImagePath(),
        answer: "F",
        optionList: abcdefOption,
      ),
      OptionLevel(
        id: 105,
        difficulty: 5,
        question: "Which is the odd one out?",
        hint: "Focus on inner triangle.",
        image: 105.toImagePath(),
        answer: "B",
      ),
      ImageOptionLevel(
        id: 112,
        difficulty: 5,
        question: "Which is the missing square?",
        hint: "Rotate triangle to the left side.",
        image: 112.toImagePath(),
        answer: "B",
        optionList: 112.toAbcdOptionImagePath(),
      ),
    ];
  }

  @override
  List<int> getLevelOrder() {
    return [
      100,
      105,
      104,
      112,
    ];
  }
}
