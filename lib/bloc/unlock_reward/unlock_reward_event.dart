abstract class UnlockRewardEvent {
  const UnlockRewardEvent();
}

class ScreenInitializedEvent extends UnlockRewardEvent {
  const ScreenInitializedEvent();
}

class RewardScratchedEvent extends UnlockRewardEvent {
  const RewardScratchedEvent();
}

class RewardClaimedEvent extends UnlockRewardEvent {
  const RewardClaimedEvent();
}
