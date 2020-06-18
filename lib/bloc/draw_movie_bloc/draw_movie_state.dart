import 'package:equatable/equatable.dart';

abstract class DrawMovieState extends Equatable {
  const DrawMovieState();
}

class InitialDrawMovieState extends DrawMovieState {
  @override
  List<Object> get props => [];
}

class MovieDrawnState extends DrawMovieState {
  final String title;
  final int year;
  final String category;
  final String director;
  final int duration;
  final String plot;
  final String posterUrl;

  @override
  List<Object> get props {
    return [
      title,
      year,
      category,
      director,
      duration,
      plot,
      posterUrl,
    ];
  }

  const MovieDrawnState({
    this.title,
    this.year,
    this.category,
    this.director,
    this.duration,
    this.plot,
    this.posterUrl,
  });
}

class ChallengeAcceptedState extends DrawMovieState {
  final String title;
  final int year;
  final String category;
  final String director;
  final int duration;
  final String plot;
  final String posterUrl;
  final Duration timeLeft;

  @override
  List<Object> get props {
    return [
      title,
      year,
      category,
      director,
      duration,
      plot,
      posterUrl,
      timeLeft,
    ];
  }

  const ChallengeAcceptedState({
    this.title,
    this.year,
    this.category,
    this.director,
    this.duration,
    this.plot,
    this.posterUrl,
    this.timeLeft,
  });
}
