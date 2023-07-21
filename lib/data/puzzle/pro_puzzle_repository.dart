import 'package:collection/collection.dart';
import 'package:math_riddle/core/app_constant.dart';
import 'package:math_riddle/data/model/base_level.dart';
import 'package:math_riddle/data/model/image_option_level.dart';
import 'package:math_riddle/data/model/option.dart';
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
        .mapIndexed((i, e) => e.copyWith(position: i + 1))
        .toList();
  }

  @override
  List<BaseLevel> getGameLevel() {
    return [
      BaseLevel(
        id: 100,
        difficulty: 5,
        image: 100.toImagePath(),
        answer: "40",
      ),
      BaseLevel(
        id: 101,
        difficulty: 5,
        image: 101.toImagePath(),
        answer: "6",
      ),
      BaseLevel(
        id: 102,
        difficulty: 5,
        image: 102.toImagePath(),
        answer: "8",
      ),
      BaseLevel(
        id: 103,
        difficulty: 5,
        image: 103.toImagePath(),
        answer: "14",
      ),
      OptionLevel(
        id: 104,
        difficulty: 5,
        image: 104.toImagePath(),
        answer: "F",
        optionList: abcdefOption,
      ),
      OptionLevel(
        id: 105,
        difficulty: 5,
        image: 105.toImagePath(),
        answer: "B",
      ),
      OptionLevel(
        id: 106,
        difficulty: 5,
        image: 106.toImagePath(),
        answer: "B",
      ),
      OptionLevel(
        id: 107,
        difficulty: 5,
        image: 107.toImagePath(),
        answer: "C",
      ),
      OptionLevel(
        id: 108,
        difficulty: 5,
        image: 108.toImagePath(),
        answer: "D",
      ),
      OptionLevel(
        id: 109,
        difficulty: 5,
        image: 109.toImagePath(),
        answer: "A",
      ),
      OptionLevel(
        id: 110,
        difficulty: 5,
        image: 110.toImagePath(),
        answer: "C",
      ),
      BaseLevel(
        id: 111,
        difficulty: 5,
        image: 111.toImagePath(),
        answer: "4",
      ),
      ImageOptionLevel(
        id: 112,
        difficulty: 5,
        image: 112.toImagePath(),
        answer: "B",
        optionList: 112.toAbcdOptionImagePath(),
      ),
      ImageOptionLevel(
        id: 113,
        difficulty: 5,
        image: 113.toImagePath(),
        answer: "A",
        optionList: 113.toAbcdOptionImagePath(),
      ),
      OptionLevel(
        id: 114,
        difficulty: 5,
        image: 114.toImagePath(),
        answer: "E",
        optionList: abcdefOption,
      ),
      ImageOptionLevel(
        id: 115,
        difficulty: 5,
        image: 115.toImagePath(),
        answer: "A",
        optionList: 115.toAbcdOptionImagePath(),
      ),
      ImageOptionLevel(
        id: 116,
        difficulty: 5,
        image: 116.toImagePath(),
        answer: "D",
        optionList: 116.toAbcdOptionImagePath(),
      ),
      OptionLevel(
        id: 117,
        difficulty: 5,
        image: 117.toImagePath(),
        answer: "Z",
        optionList: [
          const Option(name: "M"),
          const Option(name: "T"),
          const Option(name: "Z"),
          const Option(name: "L"),
        ],
      ),
      BaseLevel(
        id: 118,
        difficulty: 5,
        image: 118.toImagePath(),
        answer: "4",
      ),
      ImageOptionLevel(
        id: 119,
        difficulty: 5,
        image: 119.toImagePath(),
        answer: "D",
        optionList: 119.toAbcdOptionImagePath(),
      ),
      ImageOptionLevel(
        id: 120,
        difficulty: 5,
        image: 120.toImagePath(),
        answer: "D",
        optionList: 120.toAbcdOptionImagePath(),
      ),
      ImageOptionLevel(
        id: 121,
        difficulty: 5,
        image: 121.toImagePath(),
        answer: "D",
        optionList: 121.toAbcdOptionImagePath(),
      ),
      ImageOptionLevel(
        id: 122,
        difficulty: 5,
        image: 122.toImagePath(),
        answer: "C",
        optionList: 122.toAbcdOptionImagePath(),
      ),
      ImageOptionLevel(
        id: 123,
        difficulty: 5,
        image: 123.toImagePath(),
        answer: "D",
        optionList: 123.toAbcdOptionImagePath(),
      ),
      BaseLevel(
        id: 124,
        difficulty: 5,
        image: 124.toImagePath(),
        answer: "120",
      ),
      BaseLevel(
        id: 125,
        difficulty: 5,
        image: 125.toImagePath(),
        answer: "17",
      ),
      OptionLevel(
        id: 126,
        difficulty: 5,
        image: 126.toImagePath(),
        answer: "B",
      ),
      ImageOptionLevel(
        id: 127,
        difficulty: 5,
        image: 127.toImagePath(),
        answer: "D",
        optionList: 127.toAbcdOptionImagePath(),
      ),
      BaseLevel(
        id: 200,
        difficulty: 5,
        image: 200.toImagePath(),
        answer: "14",
      ),
      BaseLevel(
        id: 201,
        difficulty: 5,
        image: 201.toImagePath(),
        answer: "87",
      ),
      BaseLevel(
        id: 202,
        difficulty: 5,
        image: 202.toImagePath(),
        answer: "6",
      ),
      BaseLevel(
        id: 203,
        difficulty: 5,
        image: 203.toImagePath(),
        answer: "8",
      ),
      BaseLevel(
        id: 204,
        difficulty: 5,
        image: 204.toImagePath(),
        answer: "9",
      ),
      BaseLevel(
        id: 205,
        difficulty: 5,
        image: 205.toImagePath(),
        answer: "28",
      ),
      BaseLevel(
        id: 206,
        difficulty: 5,
        image: 206.toImagePath(),
        answer: "17",
      ),
      BaseLevel(
        id: 207,
        difficulty: 5,
        image: 207.toImagePath(),
        answer: "76",
      ),
      BaseLevel(
        id: 208,
        difficulty: 5,
        image: 208.toImagePath(),
        answer: "24",
      ),
      BaseLevel(
        id: 209,
        difficulty: 5,
        image: 209.toImagePath(),
        answer: "3",
      ),
      BaseLevel(
        id: 210,
        difficulty: 5,
        image: 210.toImagePath(),
        answer: "13",
      ),
      OptionLevel(
        id: 211,
        difficulty: 5,
        image: 211.toImagePath(),
        answer: "28",
        optionList: [
          const Option(name: "51"),
          const Option(name: "19"),
          const Option(name: "33"),
          const Option(name: "28"),
        ],
      ),
      BaseLevel(
        id: 212,
        difficulty: 5,
        image: 212.toImagePath(),
        answer: "4",
      ),
      BaseLevel(
        id: 213,
        difficulty: 5,
        image: 213.toImagePath(),
        answer: "4",
      ),
    ];
  }

  @override
  List<int> getLevelOrder() {
    return [
      213,
      212,
      209,
      200,
      107,
      207,
      202,
      105,
      100,
      201,
      109,
      203,
      101,
      204,
      110,
      205,
      108,
      206,
      208,
      210,
      111,
      211,
      112,
      116,
      114,
      113,
      115,
      102,
      106,
      117,
      121,
      118,
      122,
      103,
      119,
      104,
      120,
      123,
      124,
      125,
      126,
      127
    ];
  }
}
