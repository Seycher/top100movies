import 'package:applaca/bloc/unlock_reward/unlock_reward_event.dart';
import 'package:applaca/bloc/unlock_reward/unlock_reward_state.dart';
import 'package:applaca/ui/pages/list_of_movies/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnlockRewardBloc extends Bloc<UnlockRewardEvent, UnlockRewardState> {
  final GlobalKey<NavigatorState> _navigator;
  final String rewardURL;

  UnlockRewardBloc(this._navigator, this.rewardURL);

  @override
  UnlockRewardState get initialState => InitialRewardScratcherState();

  @override
  Stream<UnlockRewardState> mapEventToState(
    UnlockRewardEvent event,
  ) async* {
    if (event is ScreenInitializedEvent) {
      yield await _onScreenInitialized();
    } else if (event is RewardScratchedEvent) {
      yield await _onRewardScratched();
    } else if (event is RewardClaimedEvent) {
      _onRewardClaimed();
    }
  }

  Future<UnlockRewardState> _onScreenInitialized() async {
    return RewardNotScratchedState(rewardURL);
  }

  Future<UnlockRewardState> _onRewardScratched() async {
    return RewardIsScratchedState(rewardURL);
  }

  void _onRewardClaimed() {
    _navigator.currentState.push(ListOFMoviesRoute.get());
  }
}
