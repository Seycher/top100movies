import 'package:flutter/material.dart';

Widget buildPoster(
  final String posterUrl,
  final double height,
  final double width,
) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(posterUrl),
        fit: BoxFit.fitWidth,
      ),
    ),
  );
}
