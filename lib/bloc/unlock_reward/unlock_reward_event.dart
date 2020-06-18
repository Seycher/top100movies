abstract class UnlockRewardEvent {
  const UnlockRewardEvent();
}

class ScreenInitializedEvent extends UnlockRewardEvent {
  const ScreenInitializedEvent();
}

class RewardUnlockedEvent extends UnlockRewardEvent {
  const RewardUnlockedEvent();
}

class RewardClaimedEvent extends UnlockRewardEvent {
  const RewardClaimedEvent();
}
