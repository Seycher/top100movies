import 'package:applaca/bloc/unlock_reward/unlock_reward_bloc.dart';
import 'package:applaca/bloc/unlock_reward/unlock_reward_event.dart';
import 'package:applaca/bloc/unlock_reward/unlock_reward_state.dart';
import 'package:applaca/ui/pages/list_of_movies/navigation.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

String rewordUrl = '';
GlobalKey<NavigatorState> _globalKey;

main() {
  setUp(() {
    _globalKey = GlobalKey<NavigatorState>();
  });

  blocTest(
    'UnlockRewardBloc emits nothing when nothing added',
    build: () async => UnlockRewardBloc(_globalKey, rewordUrl),
    expect: [],
  );
  blocTest(
    'UnlockRewardBloc emits RewardNotScratchedState when ScreenInitializedEvent added',
    build: () async => UnlockRewardBloc(_globalKey, rewordUrl),
    act: (bloc) => bloc.add(ScreenInitializedEvent()),
    expect: [RewardNotScratchedState(rewordUrl)],
  );
  blocTest(
    'UnlockRewardBloc emits RewardIsScratchedState when RewardScratchedEvent added',
    build: () async => UnlockRewardBloc(_globalKey, rewordUrl),
    act: (bloc) => bloc.add(RewardScratchedEvent()),
    expect: [RewardIsScratchedState(rewordUrl)],
  );
  blocTest(
    'UnlockRewardBloc emits nothing and calls push on _globalKey when RewardClaimedEvent added',
    build: () async => UnlockRewardBloc(_globalKey, rewordUrl),
    act: (bloc) => bloc.add(RewardScratchedEvent()),
    verify: (_) async {
      verify(_globalKey.currentState.push(ListOfMoviesRoute.get()));
    },
    expect: [],
  );
}
