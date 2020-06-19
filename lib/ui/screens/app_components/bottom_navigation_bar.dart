import 'dart:math';

import 'package:applaca/bloc/bottom_navigation_bar_bloc/bottom_navigation_bar_bloc.dart';
import 'package:applaca/bloc/bottom_navigation_bar_bloc/bottom_navigation_bar_event.dart';
import 'package:applaca/bloc/no_state.dart';
import 'package:applaca/repository/shared_preferences_repository.dart';
import 'package:applaca/services/dependency_injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const kBarH = 9.5;
const kIcon = 18;

class BottomNavigation extends StatelessWidget {
  final int index;

  BottomNavigation(this.index);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return BottomNavigationBarBloc(
          getIt<GlobalKey<NavigatorState>>(),
          getIt<SharedPreferencesRepository>(),
        );
      },
      child: BlocBuilder<BottomNavigationBarBloc, NoState>(
        builder: (context, state) {
          final _bloc = BlocProvider.of<BottomNavigationBarBloc>(context);
          return Container(
            height: MediaQuery.of(context).size.height / kBarH,
            color: Colors.grey[900],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Transform.rotate(
                  angle: pi / 2,
                  child: _navigationButton(
                    onPressed: () => _bloc.add(LotteryButtonClickedEvent()),
                    context: context,
                    currentIndex: 0,
                    icon: Icons.local_movies,
                  ),
                ),
                SizedBox(width: 8),
                _navigationButton(
                  onPressed: () => _bloc.add(ListButtonClickedEvent()),
                  context: context,
                  currentIndex: 1,
                  icon: Icons.list,
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _navigationButton({
    final context,
    final currentIndex,
    final icon,
    final onPressed,
  }) {
    return IconButton(
      color: index == currentIndex ? Colors.white : Colors.grey[700],
      icon: Icon(icon, size: MediaQuery.of(context).size.height / kIcon),
      onPressed: onPressed,
    );
  }
}
