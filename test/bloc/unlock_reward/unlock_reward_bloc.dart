import 'package:applaca/bloc/unlock_reward/unlock_reward_bloc.dart';
import 'package:applaca/bloc/unlock_reward/unlock_reward_event.dart';
import 'package:applaca/bloc/unlock_reward/unlock_reward_state.dart';
import 'package:applaca/ui/screens/list_of_movies/navigation.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:scratcher/widgets.dart';

String rewardUrl = '';
GlobalKey<NavigatorState> _globalKey;
GlobalKey<ScratcherState> _scratcherKey;

main() {
  setUp(() {
    _globalKey = GlobalKey<NavigatorState>();
    _scratcherKey = GlobalKey<ScratcherState>();
  });

  blocTest(
    'UnlockRewardBloc emits nothing when nothing added',
    build: () async => UnlockRewardBloc(_globalKey, rewardUrl, _scratcherKey),
    expect: [],
  );
  blocTest(
    'UnlockRewardBloc emits RewardNotUnlockedState when ScreenInitializedEvent added',
    build: () async => UnlockRewardBloc(_globalKey, rewardUrl, _scratcherKey),
    act: (bloc) => bloc.add(ScreenInitializedEvent()),
    expect: [RewardNotUnlockedState(rewardUrl, _scratcherKey)],
  );
  blocTest(
    'UnlockRewardBloc emits RewardIsUnlockedState when RewardScratchedEvent added',
    build: () async => UnlockRewardBloc(_globalKey, rewardUrl, _scratcherKey),
    act: (bloc) => bloc.add(RewardUnlockedEvent()),
    expect: [RewardIsUnlockedState(rewardUrl, _scratcherKey)],
  );
  blocTest(
    'UnlockRewardBloc emits nothing and calls push on _globalKey when RewardClaimedEvent added',
    build: () async => UnlockRewardBloc(_globalKey, rewardUrl, _scratcherKey),
    act: (bloc) => bloc.add(RewardUnlockedEvent()),
    verify: (_) async {
      verify(_globalKey.currentState.push(ListOfMoviesRoute.get()));
    },
    expect: [],
  );
}
