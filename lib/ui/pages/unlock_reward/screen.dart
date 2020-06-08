import 'package:applaca/bloc/unlock_reward/unlock_reward_bloc.dart';
import 'package:applaca/bloc/unlock_reward/unlock_reward_event.dart';
import 'package:applaca/bloc/unlock_reward/unlock_reward_state.dart';
import 'package:applaca/services/dependency_injection/injection.dart';
import 'package:applaca/services/internationalization/app_localizations.dart';
import 'package:applaca/services/internationalization/localized_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scratcher/widgets.dart';

class UnlockRewardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _scratcherBloc = BlocProvider.of<UnlockRewardBloc>(context);
    return BlocBuilder<UnlockRewardBloc, UnlockRewardState>(
      builder: (context, state) {
        return Material(
          color: Colors.white70,
          child: _resolveState(context, _scratcherBloc, state),
        );
      },
    );
  }
}

Widget _resolveState(
  final BuildContext context,
  final UnlockRewardBloc _scratcherBloc,
  final UnlockRewardState state,
) {
  if (state is InitialRewardScratcherState) {
    _scratcherBloc.add(ScreenInitializedEvent());
    return Container(
      color: Colors.black,
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
        ),
      ),
    );
  } else if (state is RewardNotScratchedState) {
    return _createScreenContent(
      context,
      _scratcherBloc,
      AppLocalizations.of(context).translate(
          LocalizedStrings.S_Unlock_Reward_Screen_Congratulations_First),
      state.rewardURL,
      false,
    );
  } else if (state is RewardIsScratchedState) {
    return _createScreenContent(
      context,
      _scratcherBloc,
      AppLocalizations.of(context).translate(
          LocalizedStrings.S_Unlock_Reward_Screen_Congratulations_Second),
      state.rewardURL,
      true,
    );
  } else {
    return Container(color: Colors.red);
  }
}

Widget _createScreenContent(
  final BuildContext context,
  final UnlockRewardBloc _scratcherBloc,
  final String topText,
  final String rewardURL,
  final bool isVisible,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        topText,
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
      ),
      SizedBox(height: 32),
      Scratcher(
        key: getIt<GlobalKey<ScratcherState>>(),
        brushSize: 30,
        threshold: 60,
        accuracy: ScratchAccuracy.low, //set for better testing
        color: Colors.black,
        onThreshold: () {
          getIt<GlobalKey<ScratcherState>>()
              .currentState
              .reveal(duration: const Duration(seconds: 1));
          _scratcherBloc.add(RewardScratchedEvent());
        },
        child: Image.network(
          rewardURL,
          width: 250,
          height: 250,
        ),
      ),
      SizedBox(height: 32),
      Visibility(
        visible: !isVisible,
        child: Text(
          AppLocalizations.of(context)
              .translate(LocalizedStrings.S_Unlock_Reward_Screen_Call_To_Scrap),
          style: TextStyle(fontSize: 16),
        ),
      ),
      SizedBox(height: 16),
      Visibility(
        visible: isVisible,
        child: Container(
          height: 36,
          width: 93,
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              color: Colors.pink,
              child: Text(
                AppLocalizations.of(context)
                    .translate(LocalizedStrings.S_Unlock_Reward_Screen_Claim),
                style: TextStyle(color: Colors.white, letterSpacing: 1.25),
              ),
              onPressed: () {
                _scratcherBloc.add(RewardClaimedEvent());
              }),
        ),
      )
    ],
  );
}
