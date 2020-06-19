import 'dart:math';

import 'package:applaca/bloc/bottom_navigation_bar_bloc/bottom_navigation_bar_bloc.dart';
import 'package:applaca/bloc/bottom_navigation_bar_bloc/bottom_navigation_bar_event.dart';
import 'package:applaca/bloc/no_state.dart';
import 'package:applaca/repository/shared_preferences_repository.dart';
import 'package:applaca/services/dependency_injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigation extends StatelessWidget {
  final int index;

  BottomNavigation(this.index);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          BottomNavigationBarBloc(
            getIt<GlobalKey<NavigatorState>>(),
            getIt<SharedPreferencesRepository>(),
          ),
      child: BlocBuilder<BottomNavigationBarBloc, NoState>(
        builder: (context, state) {
          final _bloc = BlocProvider.of<BottomNavigationBarBloc>(context);
          return Container(
            height: 64,
            color: Colors.grey[900],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Transform.rotate(
                  angle: pi / 2,
                  child: IconButton(
                    color: index == 0 ? Colors.white : Colors.grey[700],
                    icon: Icon(
                      Icons.local_movies,
                      size: 32,
                    ),
                    onPressed: () => _bloc.add(LotteryButtonClickedEvent()),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  color: index == 1 ? Colors.white : Colors.grey[700],
                  icon: Icon(
                    Icons.list,
                    size: 32,
                  ),
                  onPressed: () => _bloc.add(ListButtonClickedEvent()),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}