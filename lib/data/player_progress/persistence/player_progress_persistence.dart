/// An interface of persistence stores for the player's progress.
///
/// Implementations can range from simple in-memory storage through
/// local preferences to cloud saves.
abstract class PlayerProgressPersistence {
  Future<int> getHighestLevelReached();

  Future<void> saveHighestLevelReached(int level);

  Future<int> getAppOpenCount();

  Future<void> setAppOpenCount();

  Future<bool> isRated();

  Future<void> setRated();

  Future<bool> isRemindMeLater();

  Future<bool> is2ndTimeRemindMeLater();

  Future<void> setRemindMeLater();

  Future<void> set2ndTimeRemindMeLater();
}
