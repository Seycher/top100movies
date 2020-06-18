import 'package:flutter/material.dart';

Widget buildLoadingIndicatorView() {
  return Container(
    color: Colors.black,
    child: Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
      ),
    ),
  );
}
