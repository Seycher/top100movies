import 'package:equatable/equatable.dart';

abstract class RewardState extends Equatable {
  const RewardState();
}

class InitialRewardState extends RewardState {
  const InitialRewardState();

  @override
  List<Object> get props => [];
}

class RewardAvailableState extends RewardState {
  final String rewardUrl;
  final String title;
  final String director;
  final String category;
  final int year;
  final int length;
  final String description;

  const RewardAvailableState({
    this.rewardUrl,
    this.title,
    this.director,
    this.category,
    this.year,
    this.length,
    this.description,
  });

  @override
  List<Object> get props => [
        title,
        year,
        category,
        director,
        description,
        length,
        rewardUrl,
      ];
}

class NoRewardAvailableState extends RewardState {
  const NoRewardAvailableState();

  @override
  List<Object> get props => [];
}
