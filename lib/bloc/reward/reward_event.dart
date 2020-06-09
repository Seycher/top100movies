import 'package:equatable/equatable.dart';

abstract class RewardEvent extends Equatable{
  const RewardEvent();
}

class RewardRequestedEvent extends RewardEvent {
  const RewardRequestedEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}
