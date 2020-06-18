import 'package:applaca/ui/common/constants/text_styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget unlockedTile({
  final String title,
  final String category,
  final int year,
  final int duration,
  final String rewardUrl,
  final DateTime time,
}) {
  return Container(
    padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 8),
    decoration: BoxDecoration(
      color: Colors.grey[900],
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AutoSizeText(
                title,
                maxLines: 1,
                style: kMovieTitleTextStyle,
              ),
              AutoSizeText(
                category,
                maxLines: 1,
                style: movieTileTextStyle,
              ),
              AutoSizeText(
                '$year',
                maxLines: 1,
                style: movieTileTextStyle,
              ),
              AutoSizeText(
                ('${duration ~/ 60}H ${duration % 60}MIN'),
                maxLines: 1,
                style: movieTileTextStyle,
              ),
              AutoSizeText(
                'Watched $time ',
                maxLines: 1,
                style: movieTileTextStyle,
              ),
            ],
          ),
        ),
        Spacer(),
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                image: NetworkImage(rewardUrl),
                alignment: FractionalOffset.center,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
