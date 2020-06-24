import 'package:flutter/material.dart';
import 'package:scratcher/widgets.dart';

abstract class UnlockRewardState {
  const UnlockRewardState();
}

class InitialRewardUnlockerState extends UnlockRewardState {
  const InitialRewardUnlockerState();
}

class RewardNotUnlockedState extends UnlockRewardState {
  final String rewardURL;
  final GlobalKey<ScratcherState> scratcherKey;

  const RewardNotUnlockedState(this.rewardURL, this.scratcherKey);
}

class RewardIsUnlockedState extends UnlockRewardState {
  final String rewardURL;
  final GlobalKey<ScratcherState> scratcherKey;

  const RewardIsUnlockedState(this.rewardURL, this.scratcherKey);
}
