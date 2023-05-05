import 'package:math_riddle/core/app_constant.dart';
import 'package:math_riddle/data/model/base_level.dart';
import 'package:math_riddle/data/model/option.dart';

class OptionLevel extends BaseLevel {
  final List<Option> optionList;

  const OptionLevel({
    required super.id,
    super.gameType = GameType.option,
    required super.difficulty,
    required super.question,
    super.hint,
    required super.image,
    required super.answer,
    this.optionList = abcdOption,
  });

  @override
  OptionLevel copyWith({
    int? id,
    GameType? gameType,
    int? difficulty,
    String? question,
    String? hint,
    String? image,
    String? answer,
    List<Option>? optionList,
  }) {
    return OptionLevel(
      id: id ?? this.id,
      gameType: gameType ?? this.gameType,
      difficulty: difficulty ?? this.difficulty,
      question: question ?? this.question,
      hint: hint ?? this.hint,
      image: image ?? this.image,
      answer: answer ?? this.answer,
      optionList: optionList ?? this.optionList,
    );
  }
}
