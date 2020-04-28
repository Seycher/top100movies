import 'package:flutter/material.dart';

import 'ui/pages/list_of_movies/screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListOfMovies(),
    );
  }
}