import 'package:applaca/ui/common/constants/style_constants.dart';
import 'package:applaca/ui/pages/list_of_movies/movie_tile_state/unlocked_movie_tile.dart';
import 'package:flutter/material.dart';

import 'movie_tile_state/locked_movie_tile.dart';

class MovieTile extends StatelessWidget {
  final String title;
  final Function onMovieClick;
  final bool isScratched;
  final String posterUrl;
  final String category;
  final int year;
  final int duration;
  final String rewardUrl;
  final DateTime time;

  MovieTile({
    this.title,
    this.onMovieClick,
    this.isScratched,
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
      padding: const EdgeInsets.all(kPaddingMedium),
      child: GestureDetector(
        onTap: onMovieClick,
        child: Container(
          height: 180,
          child: Stack(
            children: <Widget>[
              isScratched
                  ? unlockedTile(title, category, year, duration, rewardUrl)
                  : lockedTile(title, category, year, duration, posterUrl),
              isScratched ? Container() : _lockedMovieShadow(),
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
