import 'package:flutter/foundation.dart';
import 'package:math_riddle/data/model/base_level.dart';
import 'package:math_riddle/data/puzzle/i_puzzle_repository.dart';

abstract class LevelBase extends ChangeNotifier {
  final int position;
  final IPuzzleRepository puzzleRepository;
  late BaseLevel level;

  LevelBase({
    required this.position,
    required this.puzzleRepository,
  });

  bool evaluate();

  void levelUp({required int newPosition});
}
