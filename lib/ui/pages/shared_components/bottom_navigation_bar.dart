import 'package:applaca/bloc/list_of_movies_bloc/list_of_movies_bloc.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final ListOfMoviesBloc listOfMoviesBloc;
  final int index;

  BottomNavigation(this.listOfMoviesBloc, this.index);

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {
                //TODO: nawigacja do loterii
              },
            ),
          ),
          title: Text("", style: TextStyle(fontSize: 0)),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(
              Icons.list,
              size: 32,
            ),
            onPressed: () {
              //TODO: nawigacja do listy
            },
          ),
          title: Text("", style: TextStyle(fontSize: 0)),
        ),
      ],
    );
  }
}
