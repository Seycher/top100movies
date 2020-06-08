import 'package:applaca/bloc/reward/reward_event.dart';
import 'package:applaca/bloc/reward/reward_state.dart';
import 'package:applaca/repository/movie.dart';
import 'package:applaca/repository/movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RewardBloc extends Bloc<RewardEvent, RewardState> {
  final MovieRepository _movieRepository;
  final String movieTitle;

  RewardBloc(this._movieRepository, this.movieTitle);

  @override
  RewardState get initialState => InitialRewardState();

  @override
  Stream<RewardState> mapEventToState(
    RewardEvent event,
  ) async* {
    if (event is RewardRequestedEvent) {
      yield await _onMovieDetailsRequested(event);
    }
  }

  Future<RewardState> _onMovieDetailsRequested(
      RewardRequestedEvent event) async {
    final Movie movie = await _movieRepository.getSingleMovie(movieTitle);

    if (movie != null) {
      return RewardAvailableState(
        rewardUrl: movie.rewardUrl,
        title: movie.title,
        director: movie.director,
        category: movie.category,
        year: movie.year,
        length: movie.duration,
        description: movie.encouragement,
      );
    } else {
      return NoRewardAvailableState();
    }
  }
}
