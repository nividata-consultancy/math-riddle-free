import 'package:shared_preferences/shared_preferences.dart';

import 'player_progress_persistence.dart';

/// An implementation of [PlayerProgressPersistence] that uses
/// `package:shared_preferences`.
class LocalStoragePlayerProgressPersistence extends PlayerProgressPersistence {
  final Future<SharedPreferences> instanceFuture =
      SharedPreferences.getInstance();

  @override
  Future<int> getHighestLevelReached() async {
    final prefs = await instanceFuture;
    return prefs.getInt('highestLevelReached') ?? 0;
  }

  @override
  Future<void> saveHighestLevelReached(int level) async {
    final prefs = await instanceFuture;
    await prefs.setInt('highestLevelReached', level);
  }

  @override
  Future<int> getAppOpenCount() async {
    final prefs = await instanceFuture;
    return prefs.getInt('appOpenCount') ?? 0;
  }

  @override
  Future<void> setAppOpenCount() async {
    final prefs = await instanceFuture;
    int count = await getAppOpenCount();
    await prefs.setInt('appOpenCount', count + 1);
  }

  @override
  Future<bool> isRated() async {
    final prefs = await instanceFuture;
    return prefs.getBool('isRated') ?? false;
  }

  @override
  Future<void> setRated() async {
    final prefs = await instanceFuture;
    await prefs.setBool('isRated', true);
  }

  @override
  Future<bool> isRemindMeLater() async {
    final prefs = await instanceFuture;
    return prefs.getBool('isRemindMeLater') ?? false;
  }

  @override
  Future<void> setRemindMeLater() async {
    final prefs = await instanceFuture;
    await prefs.setBool('isRemindMeLater', true);
  }

  @override
  Future<bool> is2ndTimeRemindMeLater() async {
    final prefs = await instanceFuture;
    return prefs.getBool('is2ndTimeRemindMeLater') ?? false;
  }

  @override
  Future<void> set2ndTimeRemindMeLater() async {
    final prefs = await instanceFuture;
    await prefs.setBool('is2ndTimeRemindMeLater', true);
  }
}
