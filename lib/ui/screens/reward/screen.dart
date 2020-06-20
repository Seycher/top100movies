import 'package:applaca/bloc/reward/reward_bloc.dart';
import 'package:applaca/bloc/reward/reward_event.dart';
import 'package:applaca/bloc/reward/reward_state.dart';
import 'package:applaca/ui/screens/app_components/bottom_navigation.dart';
import 'package:applaca/ui/screens/app_components/loading_indicator_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import 'components/empty_reward_body.dart';
import 'components/filled_reward_body.dart';

class RewardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RewardBloc _detailsBloc = BlocProvider.of<RewardBloc>(context);
    return BlocBuilder<RewardBloc, RewardState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: _resolveState(_detailsBloc, state),
          bottomNavigationBar: BottomNavigation(currentIndex: 1),
        );
      },
    );
  }

  Widget _resolveState(
    final RewardBloc detailsBloc,
    final RewardState state,
  ) {
    if (state is InitialRewardState) {
      detailsBloc.add(RewardRequestedEvent());
      return buildLoadingIndicatorView();
    } else if (state is NoRewardAvailableState) {
      return EmptyRewardBody();
    } else if (state is RewardAvailableState) {
      return FilledRewardBody(
        rewardUrl: state.rewardUrl,
        title: state.title,
        director: state.director,
        category: state.category,
        year: state.year,
        length: state.length,
        description: state.description,
      );
    }
    Logger().e('Unknown RewardState: ${state.runtimeType}.'
        ' Returning red Containter');
    return Container(
      color: Colors.red,
    );
  }
}
