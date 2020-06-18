import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget buildButton({
  final Color color,
  final String text,
  final Function function,
  final double fontSize,
}) {
  return RaisedButton(
    onPressed: function,
    color: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    child: AutoSizeText(
      text,
      maxLines: 1,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.white,
        letterSpacing: 1.25,
      ),
    ),
  );
}
