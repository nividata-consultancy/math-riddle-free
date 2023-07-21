import 'package:math_riddle/core/app_constant.dart';
import 'package:math_riddle/data/model/base_level.dart';
import 'package:math_riddle/data/model/option.dart';

class OptionLevel extends BaseLevel {
  final List<Option> optionList;

  const OptionLevel({
    super.position,
    required super.id,
    super.gameType = GameType.option,
    required super.difficulty,
    required super.image,
    required super.answer,
    this.optionList = abcdOption,
  });

  @override
  OptionLevel copyWith({
    int? position,
    int? id,
    GameType? gameType,
    int? difficulty,
    String? image,
    String? answer,
    List<Option>? optionList,
  }) {
    return OptionLevel(
      position: position ?? this.position,
      id: id ?? this.id,
      gameType: gameType ?? this.gameType,
      difficulty: difficulty ?? this.difficulty,
      image: image ?? this.image,
      answer: answer ?? this.answer,
      optionList: optionList ?? this.optionList,
    );
  }
}
