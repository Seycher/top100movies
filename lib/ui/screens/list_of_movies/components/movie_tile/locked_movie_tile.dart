import 'package:applaca/ui/common/constants/text_styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget lockedTile({
  final String title,
  final String category,
  final int year,
  final int duration,
  final String posterUrl,
}) {
  return Column(
    children: <Widget>[
      Expanded(
        flex: 9,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            image: DecorationImage(
              image: NetworkImage(posterUrl),
              alignment: FractionalOffset.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
      Expanded(
        flex: 7,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
            color: Colors.grey[900],
          ),
          padding: EdgeInsets.only(top: 18, left: 16, bottom: 18, right: 16),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 3,
                child: Row(
                  children: <Widget>[
                    AutoSizeText(
                      title,
                      maxLines: 1,
                      style: kMovieTitleTextStyle,
                    ),
                    Spacer(),
                    AutoSizeText(
                      category,
                      maxLines: 1,
                      style: movieTileTextStyle,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Flexible(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    AutoSizeText(
                      '$year',
                      maxLines: 1,
                      style: movieTileTextStyle,
                    ),
                    Spacer(),
                    AutoSizeText(
                      ('${duration ~/ 60}H ${duration % 60}MIN'),
                      maxLines: 1,
                      style: movieTileTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
