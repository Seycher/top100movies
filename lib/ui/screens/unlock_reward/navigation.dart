import 'package:applaca/bloc/unlock_reward/unlock_reward_bloc.dart';
import 'package:applaca/services/dependency_injection/injection.dart';
import 'package:applaca/ui/screens/unlock_reward/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scratcher/widgets.dart';

class UnlockRewardRoute extends PopupRoute {
  final child;

  UnlockRewardRoute(this.child);

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => false;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => Duration();

  static Route get(final rewardURL) {
    return UnlockRewardRoute(
      BlocProvider(
        create: (BuildContext context) => UnlockRewardBloc(
          getIt<GlobalKey<NavigatorState>>(),
          rewardURL,
          GlobalKey<ScratcherState>(),
        ),
        child: UnlockRewardScreen(),
      ),
    );
  }
}
