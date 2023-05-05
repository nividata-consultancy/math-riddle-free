import 'package:math_riddle/core/app_constant.dart';

class BaseLevel {
  final int id;
  final GameType gameType;
  final int difficulty;
  final String question;
  final String hint;
  final String image;
  final String answer;

  const BaseLevel({
    required this.id,
    this.gameType = GameType.numpad,
    required this.difficulty,
    required this.question,
    this.hint = "",
    required this.image,
    required this.answer,
  });

  BaseLevel copyWith({
    int? id,
    GameType? gameType,
    int? difficulty,
    String? question,
    String? hint,
    String? image,
    String? answer,
  }) {
    return BaseLevel(
      id: id ?? this.id,
      gameType: gameType ?? this.gameType,
      difficulty: difficulty ?? this.difficulty,
      question: question ?? this.question,
      hint: hint ?? this.hint,
      image: image ?? this.image,
      answer: answer ?? this.answer,
    );
  }
}
