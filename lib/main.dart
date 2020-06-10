import 'package:applaca/ui/app.dart';
import 'package:flutter/material.dart';

import 'services/dependency_injection/injection.dart';

void main() {
  configureDependencies();
  runApp(Application());
}
