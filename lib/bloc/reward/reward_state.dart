abstract class RewardState {
  const RewardState();
}

class InitialRewardState extends RewardState {
  const InitialRewardState();
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
}

class NoRewardAvailableState extends RewardState {
  const NoRewardAvailableState();
}
