import 'package:collection/collection.dart';
import 'package:math_riddle/core/app_constant.dart';
import 'package:math_riddle/data/model/option.dart';
import 'package:math_riddle/data/model/option_level.dart';

import 'level_base.dart';

class LevelState extends LevelBase {
  String input = "";
  List<Option> optionList = [];

  LevelState({
    required super.position,
    required super.puzzleRepository,
  }) {
    _setUpNewLevel(position: position);
  }

  void _setUpNewLevel({required int position}) {
    input = "";
    level = puzzleRepository
        .getGameLevelByOrder()
        .firstWhere((element) => element.position == position);
    if (level.gameType != GameType.numpad) {
      optionList = (level as OptionLevel).optionList;
    } else {
      optionList = [];
    }
    notifyListeners();
  }

  void onTextChange(String value) {
    if (input.length < 3) {
      input = input + value;
      notifyListeners();
    }
  }

  void onBackSpace() {
    if (input.isNotEmpty) {
      input = input.substring(0, input.length - 1);
      notifyListeners();
    }
  }

  void onOptionSelection({required Option option}) {
    optionList = optionList.map((e) {
      if (e.name == option.name) {
        return option.copyWith(isSelected: true);
      } else {
        return e.copyWith(isSelected: false);
      }
    }).toList();
    notifyListeners();
  }

  @override
  bool evaluate() {
    if (level.gameType == GameType.numpad) {
      if (input == level.answer) {
        return true;
      } else {
        input = "";
        notifyListeners();
        return false;
      }
    } else {
      return level.answer ==
          optionList.firstWhereOrNull((element) => element.isSelected)?.name;
    }
  }

  @override
  void levelUp({required int newPosition}) {
    _setUpNewLevel(position: newPosition);
  }
}
