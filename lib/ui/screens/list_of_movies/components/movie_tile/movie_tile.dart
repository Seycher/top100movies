import 'package:applaca/ui/screens/list_of_movies/components/movie_tile/unlocked_movie_tile.dart';
import 'package:flutter/material.dart';

import 'locked_movie_tile.dart';

class MovieTile extends StatelessWidget {
  final String title;
  final Function onMovieClick;
  final bool isUnlocked;
  final String posterUrl;
  final String category;
  final int year;
  final int duration;
  final String rewardUrl;
  final DateTime time;

  MovieTile({
    this.title,
    this.onMovieClick,
    this.isUnlocked,
    this.posterUrl,
    this.category,
    this.year,
    this.duration,
    this.rewardUrl,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: onMovieClick,
        child: Container(
          height: 180,
          child: Stack(
            children: <Widget>[
              isUnlocked
                  ? unlockedTile(
                title: title,
                category: category,
                year: year,
                duration: duration,
                rewardUrl: rewardUrl,
                time: time,
              )
                  : lockedTile(
                title: title,
                category: category,
                year: year,
                duration: duration,
                posterUrl: posterUrl,
              ),
              isUnlocked ? Container() : _lockedMovieShadow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _lockedMovieShadow() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.5,
          child: Container(
            color: Colors.black,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
        Center(
          child: Icon(
            Icons.lock,
            color: Colors.white,
            size: 40,
          ),
        )
      ],
    );
  }
}
