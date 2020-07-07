import 'package:applaca/bloc/reward/reward_bloc.dart';
import 'package:applaca/bloc/reward/reward_event.dart';
import 'package:applaca/bloc/reward/reward_state.dart';
import 'package:applaca/repository/model/movie.dart';

import 'package:applaca/repository/movie_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MovieRepositoryMock extends Mock implements MovieRepository {}

MovieRepositoryMock _repo;
const String title = 'Title';
final movie = Movie(1, title, 1, '', '', 1, '', '', DateTime(1), '', '', false);

main() {
  setUp(() {
    _repo = MovieRepositoryMock();
  });
  blocTest(
    'RewardBloc emits nothing when nothing added',
    build: () async => RewardBloc(_repo, title),
    expect: [],
  );
  blocTest(
    'RewardBloc calls getSingleMovie method on repo when RewardRequestedEvent added',
    build: () async => RewardBloc(_repo, title),
    act: (bloc) => bloc.add(RewardRequestedEvent()),
    verify: (_) async => verify(_repo.getSingleMovieByTitle(title)).called(1),
  );
  blocTest(
    'RewardBloc emits NoRewardAvailableState when RewardRequestedEvent added and repo gets back null as movie',
    build: () async => RewardBloc(_repo, title),
    act: (bloc) => bloc.add(RewardRequestedEvent()),
    verify: (_) async => verify(_repo.getSingleMovieByTitle(title)).called(1),
    expect: [NoRewardAvailableState()],
  );
  blocTest(
    'RewardBloc emits RewardAvailableState when RewardRequestedEvent added and repo gets movie',
    build: () async {
      when(_repo.getSingleMovieByTitle(title)).thenAnswer(
        (realInvocation) => Future.value(movie),
      );
      return RewardBloc(_repo, title);
    },
    act: (bloc) => bloc.add(RewardRequestedEvent()),
    verify: (_) async => verify(_repo.getSingleMovieByTitle(title)).called(1),
    expect: [
      RewardAvailableState(
          rewardUrl: '',
          title: title,
          director: '',
          category: '',
          year: 1,
          length: 1,
          description: '')
    ],
  );
}
