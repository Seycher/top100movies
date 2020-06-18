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
      create: (BuildContext context) => BottomNavigationBarBloc(
        getIt<GlobalKey<NavigatorState>>(),
        getIt<SharedPreferencesRepository>(),
      ),
      child: BlocBuilder<BottomNavigationBarBloc, NoState>(
        builder: (context, state) {
          final _bottomNavigationBarBloc =
              BlocProvider.of<BottomNavigationBarBloc>(context);
          return BottomNavigationBar(
            currentIndex: index,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey[700],
            backgroundColor: Colors.grey[900],
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Transform.rotate(
                  angle: 1.55,
                  child: IconButton(
                    icon: Icon(
                      Icons.local_movies,
                      size: 32,
                    ),
                    onPressed: () => _bottomNavigationBarBloc.add(
                      LotteryButtonClickedEvent(),
                    ),
                  ),
                ),
                title: Text(
                  "",
                  style: TextStyle(fontSize: 0),
                ),
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  icon: Icon(
                    Icons.list,
                    size: 32,
                  ),
                  onPressed: () => _bottomNavigationBarBloc.add(
                    ListButtonClickedEvent(),
                  ),
                ),
                title: Text(
                  "",
                  style: TextStyle(fontSize: 0),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
