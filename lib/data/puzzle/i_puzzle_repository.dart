import 'package:math_riddle/data/model/base_level.dart';

abstract class IPuzzleRepository {
  List<BaseLevel> getGameLevelByOrder();

  List<BaseLevel> getGameLevel();

  List<int> getLevelOrder();
}
