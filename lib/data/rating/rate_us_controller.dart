import 'package:math_riddle/data/player_progress/persistence/player_progress_persistence.dart';

class RateUsController {
  final PlayerProgressPersistence store;
  bool isRated = false;
  bool isRemindMeLater = false;
  bool is2ndTimeRemindMeLater = false;
  int appOpenCount = 1;

  RateUsController({required this.store}) {
    store.isRated().then((value) {
      isRated = value;
    });

    store.isRemindMeLater().then((value) {
      isRemindMeLater = value;
    });

    store.getAppOpenCount().then((value) {
      appOpenCount = value;
    });
  }

  Future<void> setAppOpenCount() async {
    appOpenCount++;
    await store.setAppOpenCount();
  }

  Future<void> setRated() async {
    isRated = true;

    await store.setRated();
  }

  Future<void> setRemindMeLater() async {
    isRemindMeLater = true;
    await store.setRemindMeLater();
  }

  Future<void> set2ndTimeRemindMeLater() async {
    is2ndTimeRemindMeLater = true;
    await store.set2ndTimeRemindMeLater();
  }
}
