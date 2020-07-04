import 'dart:math';

import 'package:applaca/bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:applaca/bloc/bottom_navigation_bloc/bottom_navigation_event.dart';
import 'package:applaca/bloc/no_state.dart';
import 'package:applaca/services/dependency_injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const kBarH = 0.1;
const kLotteryIcon = 0.05;
const kListIcon = 0.058;

class BottomNavigation extends StatelessWidget {
  final int currentIndex;

  const BottomNavigation({this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return BottomNavigationBloc(
          getIt<GlobalKey<NavigatorState>>(),
        );
      },
      child: BlocBuilder<BottomNavigationBloc, NoState>(
        builder: (context, state) {
          return Container(
            height: MediaQuery.of(context).size.height * kBarH,
            color: Colors.grey[900],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Transform.rotate(
                  angle: pi / 2,
                  child: _buildNavigationButton(
                    context: context,
                    index: 0,
                    iconSize: kLotteryIcon,
                    icon: Icons.local_movies,
                    onPressed: () {
                      return BlocProvider.of<BottomNavigationBloc>(context)
                          .add(DrawMovieButtonPressedEvent(currentIndex));
                    },
                  ),
                ),
                SizedBox(width: 8),
                _buildNavigationButton(
                  context: context,
                  index: 1,
                  iconSize: kListIcon,
                  icon: Icons.list,
                  onPressed: () {
                    return BlocProvider.of<BottomNavigationBloc>(context)
                        .add(ListButtonClickedEvent(currentIndex));
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNavigationButton({
    final context,
    final index,
    final icon,
    final iconSize,
    final onPressed,
  }) {
    return IconButton(
      color: currentIndex == index ? Colors.white : Colors.grey[700],
      icon: Icon(icon, size: MediaQuery.of(context).size.height * iconSize),
      onPressed: onPressed,
    );
  }
}
