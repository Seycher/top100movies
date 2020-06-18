import 'package:flutter/material.dart';
//// This is a custom [Scaffold] widget that stores all
//// boiler code to facilitate the setting of a responsive screen.
//// If you need some [Scaffold] functionality that is not here,
//// just add it as named parameter.
//// Greetings!!!

class ResponsiveScaffold extends StatelessWidget {
  final AppBar appBar;
  final Drawer drawer;
  final Widget floatingActionButton;
  final Widget bottomNavigationBar;
  final Widget Function(
    BuildContext context,
    SizeInformation constrains,
  ) builder;

  const ResponsiveScaffold({
    Key key,
    @required this.builder,
    this.appBar,
    this.drawer,
    this.floatingActionButton,
    this.bottomNavigationBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final sizeInformation = SizeInformation(width, height);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      body: Builder(builder: (context) => builder(context, sizeInformation)),
      drawer: drawer,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

class SizeInformation {
  final double width;
  final double height;

  const SizeInformation(this.width, this.height);
}
