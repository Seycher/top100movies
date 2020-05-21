import 'package:applaca/home.dart';
import 'package:applaca/model/test_repo.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigator =
      GlobalKey<NavigatorState>();
  static final TestRepo testRepo = TestRepo();

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
