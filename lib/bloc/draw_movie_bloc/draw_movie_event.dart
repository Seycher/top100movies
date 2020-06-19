import 'package:equatable/equatable.dart';

abstract class DrawMovieEvent extends Equatable {
  const DrawMovieEvent();
}

class SelectTheInitialState extends DrawMovieEvent {
  @override
  List<Object> get props => [];

  const SelectTheInitialState();
}

class ShuffleButtonPressedEvent extends DrawMovieEvent {
  @override
  List<Object> get props => [];

  const ShuffleButtonPressedEvent();
}

class DrawAgainButtonPressedEvent extends DrawMovieEvent {
  @override
  List<Object> get props => [];

  const DrawAgainButtonPressedEvent();
}

class ChallengeAcceptedButtonPressedEvent extends DrawMovieEvent {
  @override
  List<Object> get props => [];

  const ChallengeAcceptedButtonPressedEvent();
}

class SawItButtonPressedEvent extends DrawMovieEvent {
  @override
  List<Object> get props => [];

  const SawItButtonPressedEvent();
}

class ChallengeCompletedButtonPressedEvent extends DrawMovieEvent {
  @override
  List<Object> get props => [];

  const ChallengeCompletedButtonPressedEvent();
}

class ResignationButtonPressedEvent extends DrawMovieEvent {
  @override
  List<Object> get props => [];

  const ResignationButtonPressedEvent();
}
