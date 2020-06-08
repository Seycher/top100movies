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

class RewardIsScratchedState extends UnlockRewardState {
  final String rewardURL;

  const RewardIsScratchedState(this.rewardURL);
}
