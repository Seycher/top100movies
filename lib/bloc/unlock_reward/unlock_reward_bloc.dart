import 'package:applaca/bloc/unlock_reward/unlock_reward_event.dart';
import 'package:applaca/bloc/unlock_reward/unlock_reward_state.dart';
import 'package:applaca/ui/screens/list_of_movies/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scratcher/widgets.dart';

class UnlockRewardBloc extends Bloc<UnlockRewardEvent, UnlockRewardState> {
  final GlobalKey<NavigatorState> _navigator;
  final String rewardURL;
  final GlobalKey<ScratcherState> scratcherKey;

  UnlockRewardBloc(this._navigator, this.rewardURL, this.scratcherKey);

  @override
  UnlockRewardState get initialState => InitialRewardUnlockerState();

  @override
  Stream<UnlockRewardState> mapEventToState(
    UnlockRewardEvent event,
  ) async* {
    if (event is ScreenInitializedEvent) {
      yield await _onScreenInitialized();
    } else if (event is RewardUnlockedEvent) {
      yield await _onRewardUnlocked();
    } else if (event is RewardClaimedEvent) {
      _onRewardClaimed();
    }
  }

  Future<UnlockRewardState> _onScreenInitialized() async {
    return RewardNotUnlockedState(rewardURL, scratcherKey);
  }

  Future<UnlockRewardState> _onRewardUnlocked() async {
    return RewardIsUnlockedState(rewardURL, scratcherKey);
  }

  void _onRewardClaimed() {
    _navigator.currentState.push(ListOfMoviesRoute.get());
  }
}
