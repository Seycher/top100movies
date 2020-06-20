import 'package:applaca/bloc/unlock_reward/unlock_reward_bloc.dart';
import 'package:applaca/bloc/unlock_reward/unlock_reward_event.dart';
import 'package:applaca/bloc/unlock_reward/unlock_reward_state.dart';
import 'package:applaca/services/internationalization/app_localizations.dart';
import 'package:applaca/services/internationalization/localized_strings.dart';
import 'package:applaca/ui/screens/app_components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scratcher/widgets.dart';

class UnlockRewardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _unlockerBloc = BlocProvider.of<UnlockRewardBloc>(context);
    return BlocBuilder<UnlockRewardBloc, UnlockRewardState>(
      builder: (context, state) {
        return Material(
          color: Colors.white70,
          child: _resolveState(context, _unlockerBloc, state),
        );
      },
    );
  }
}

Widget _resolveState(
  final BuildContext context,
  final UnlockRewardBloc _unlockerBloc,
  final UnlockRewardState state,
) {
  if (state is InitialRewardUnlockerState) {
    _unlockerBloc.add(ScreenInitializedEvent());
    return Container(
      color: Colors.black,
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
        ),
      ),
    );
  } else if (state is RewardNotUnlockedState) {
    return _createScreenContent(
      context: context,
      unlockerBloc: _unlockerBloc,
      topText: AppLocalizations.of(context).translate(
          LocalizedStrings.Unlock_Reward_Screen_Congratulations_First),
      rewardURL: state.rewardURL,
      isVisible: false,
      scratcherKey: state.scratcherKey,
    );
  } else if (state is RewardIsUnlockedState) {
    return _createScreenContent(
      context: context,
      unlockerBloc: _unlockerBloc,
      topText: AppLocalizations.of(context).translate(
          LocalizedStrings.Unlock_Reward_Screen_Congratulations_Second),
      rewardURL: state.rewardURL,
      isVisible: true,
      scratcherKey: state.scratcherKey,
    );
  } else {
    return Container(color: Colors.red);
  }
}

Widget _createScreenContent({
  final BuildContext context,
  final UnlockRewardBloc unlockerBloc,
  final String topText,
  final String rewardURL,
  final bool isVisible,
  final GlobalKey<ScratcherState> scratcherKey,
}) {
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
        key: scratcherKey,
        brushSize: 30,
        threshold: 60,
        accuracy: ScratchAccuracy.low, //set for better testing
        color: Colors.black,
        onThreshold: () {
          scratcherKey.currentState
              .reveal(duration: const Duration(seconds: 1));
          unlockerBloc.add(RewardUnlockedEvent());
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
              .translate(LocalizedStrings.Unlock_Reward_Screen_Call_To_Scrap),
          style: TextStyle(fontSize: 16),
        ),
      ),
      SizedBox(height: 16),
      Visibility(
        visible: isVisible,
        child: Container(
          height: 36,
          width: 93,
          child: buildButton(
              fontSize: 14,
              color: Colors.pink,
              text: AppLocalizations.of(context)
                  .translate(LocalizedStrings.Unlock_Reward_Screen_Claim),
              function: () => unlockerBloc.add(RewardClaimedEvent())),
        ),
      )
    ],
  );
}
