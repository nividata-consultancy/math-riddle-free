import 'package:math_riddle/core/app_constant.dart';

class BaseLevel {
  final int position;
  final int id;
  final GameType gameType;
  final int difficulty;
  final String image;
  final String answer;

  const BaseLevel({
    this.position = 1,
    required this.id,
    this.gameType = GameType.numpad,
    required this.difficulty,
    required this.image,
    required this.answer,
  });

  BaseLevel copyWith({
    int? position,
    int? id,
    GameType? gameType,
    int? difficulty,
    String? image,
    String? answer,
  }) {
    return BaseLevel(
      position: position ?? this.position,
      id: id ?? this.id,
      gameType: gameType ?? this.gameType,
      difficulty: difficulty ?? this.difficulty,
      image: image ?? this.image,
      answer: answer ?? this.answer,
    );
  }
}
