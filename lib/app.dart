import 'package:applaca/services/injection.dart';
import 'package:flutter/material.dart';

import 'file:///C:/Users/Mleczny/AndroidStudioProjects/mikroprodukt/lib/ui/pages/home.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'top100',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: getIt<GlobalKey<NavigatorState>>(),
      home: Home(),
    );
  }
}
