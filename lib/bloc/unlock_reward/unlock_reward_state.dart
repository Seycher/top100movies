abstract class UnlockRewardState {
  const UnlockRewardState();
}

class InitialRewardScratcherState extends UnlockRewardState {
  const InitialRewardScratcherState();
}

class RewardNotScratchedState extends UnlockRewardState {
  final String rewardURL;

  const RewardNotScratchedState(this.rewardURL);
}

class RewardIsUnlockedState extends UnlockRewardState {
  final String rewardURL;

  const RewardIsUnlockedState(this.rewardURL);
}
