import 'package:applaca/database/database.dart';
import 'package:applaca/database/movie/movie_dao.dart';
import 'package:applaca/home.dart';
import 'package:applaca/repository/movie_repository.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  static final _database = Database();
  static final navigator = GlobalKey<NavigatorState>();
  static final movieRepository = MovieRepository(MovieDao(_database));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'top100',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: Application.navigator,
      home: Home(),
    );
  }
}
