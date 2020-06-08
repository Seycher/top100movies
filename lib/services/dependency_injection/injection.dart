import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:scratcher/scratcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injection.iconfig.dart';

final getIt = GetIt.instance;

@injectableInit
void configureDependencies() {
  manualSetupForService();
  $initGetIt(getIt);
}

void manualSetupForService() {
  getIt.registerLazySingletonAsync(() => SharedPreferences.getInstance());
  getIt.registerLazySingleton<GlobalKey<NavigatorState>>(() {
    return GlobalKey<NavigatorState>();
  });
  getIt.registerLazySingleton<GlobalKey<ScratcherState>>(() {
    return GlobalKey<ScratcherState>();
  });
}
