import 'player_progress_persistence.dart';

/// An in-memory implementation of [PlayerProgressPersistence].
/// Useful for testing.
class MemoryOnlyPlayerProgressPersistence implements PlayerProgressPersistence {
  int level = 0;

  @override
  Future<int> getHighestLevelReached() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return level;
  }

  @override
  Future<void> saveHighestLevelReached(int level) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    this.level = level;
  }

  @override
  Future<int> getAppOpenCount() {
    throw UnimplementedError();
  }

  @override
  Future<bool> isRated() {
    throw UnimplementedError();
  }

  @override
  Future<bool> isRemindMeLater() {
    throw UnimplementedError();
  }

  @override
  Future<void> setAppOpenCount() {
    throw UnimplementedError();
  }

  @override
  Future<void> setRated() {
    throw UnimplementedError();
  }

  @override
  Future<void> setRemindMeLater() {
    throw UnimplementedError();
  }

  @override
  Future<bool> is2ndTimeRemindMeLater() {
    throw UnimplementedError();
  }

  @override
  Future<void> set2ndTimeRemindMeLater() {
    throw UnimplementedError();
  }
}
