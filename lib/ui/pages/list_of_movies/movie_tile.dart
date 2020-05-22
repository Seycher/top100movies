import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  final String movieTitle;
  final Function onClick;
  final bool isUnlocked;
  final String posterUrl;

  MovieTile({
    this.movieTitle,
    this.onClick,
    this.isUnlocked,
    this.posterUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: onClick,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    movieTitle,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                  width: double.infinity,
                  color: Colors.blue,
                  child: Image.network(posterUrl)),
            )
          ],
        ),
      ),
    );
  }
}
