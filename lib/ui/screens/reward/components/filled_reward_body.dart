import 'package:applaca/ui/common/constants/text_styles.dart';
import 'package:flutter/material.dart';

class FilledRewardBody extends StatelessWidget {
  final String rewardUrl;
  final String title;
  final String director;
  final String category;
  final int year;
  final int length;
  final String description;

  const FilledRewardBody({
    this.rewardUrl,
    this.title,
    this.director,
    this.category,
    this.year,
    this.length,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Image.network(rewardUrl),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: kMovieDetailsTitleTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  director,
                  style: kMovieDetailsInfoTextStyle,
                ),
                Text(
                  category,
                  style: kMovieDetailsInfoTextStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '$year',
                  style: kMovieDetailsInfoTextStyle,
                ),
                Text(
                  ('${length ~/ 60}h ${length % 60}min'),
                  style: kMovieDetailsInfoTextStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 24.0),
            child: Text(
              description,
              style: kMovieDetailsDescriptionTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
