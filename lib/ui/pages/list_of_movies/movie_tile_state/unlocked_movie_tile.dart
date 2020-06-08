import 'package:applaca/ui/common/constants/style_constants.dart';
import 'package:applaca/ui/common/constants/text_styles.dart';
import 'package:flutter/material.dart';

Widget unlockedTile(
  final String title,
  final String category,
  final int year,
  final int duration,
  final String rewordUrl,
) {
  return Container(
    padding: const EdgeInsets.only(
        top: kPaddingSmall,
        bottom: kPaddingSmall,
        right: kPaddingSmall,
        left: kPaddingMedium),
    decoration: BoxDecoration(
      color: Colors.grey[900],
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title, style: kTitleTextStyle),
              Text(category, style: kMovieTileTextStyle),
              Text('$year', style: kMovieTileTextStyle),
              Text(('${duration ~/ 60}H ${duration % 60}MIN'),
                  style: kMovieTileTextStyle),
              Text('Watched', style: kMovieTileTextStyle),
              //TODO: data odblokowania
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                image: NetworkImage(rewordUrl),
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
