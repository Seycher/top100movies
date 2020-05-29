import 'package:applaca/ui/common/constants/text_styles.dart';
import 'package:flutter/material.dart';

Widget lockedTile(
  final String title,
  final String category,
  final int year,
  final int duration,
  final String posterUrl,
) {
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
              Row(
                children: <Widget>[
                  Text(
                    title,
                    style: titleTextStyle,
                  ),
                  Spacer(),
                  Text(category, style: movieTileTextStyle),
                ],
              ),
              Spacer(),
              Row(
                children: <Widget>[
                  Text('$year', style: movieTileTextStyle),
                  Spacer(),
                  Text(
                    ('${duration ~/ 60}H ${duration % 60}MIN'),
                    style: movieTileTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
