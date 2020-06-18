import 'package:flutter/material.dart';

Widget alpacaWidget(
  final String text,
  final context,
) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.grey[800],
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(text,
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.height / 45)),
        Container(
          child: Text(
              'Tu wstaw Alpake\n'
              'Tu wstaw Alpake\n'
              'Tu wstaw Alpake\n'
              'Tu wstaw Alpake\n'
              'Tu wstaw Alpake\n'
              'Tu wstaw Alpake',
              style: TextStyle(
                  fontSize:
                      MediaQuery.of(context).size.height / 45)), //TODO: ALPAKA
        ),
      ],
    ),
  );
}
