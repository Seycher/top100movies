import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigation extends StatelessWidget {
  final int index;

  BottomNavigation(this.index);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: _onIconTapped,
      backgroundColor: Colors.grey[900],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey[500],
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Transform.rotate(
              angle: pi / 2, //90 degrees
              child: Icon(
                Icons.local_movies,
                size:
                    40, //icons have different sizes because this one has inherent padding making it smaller
              )),
          title: Text('', style: TextStyle(fontSize: 0)),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.listUl,
            size: 32,
          ),
          title: Text('', style: TextStyle(fontSize: 0)),
        ),
      ],
    );
  }

  _onIconTapped(index) {
    //TODO:Event do bloca
  }
}
