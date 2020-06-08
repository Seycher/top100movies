import 'package:applaca/bloc/reward/reward_bloc.dart';
import 'package:applaca/repository/movie_repository.dart';
import 'package:applaca/services/dependency_injection/injection.dart';
import 'package:applaca/ui/pages/reward/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RewardRoute {
  static Route get(final String title) {
    return MaterialPageRoute(
      builder: (BuildContext context) => BlocProvider(
        create: (BuildContext context) =>
            RewardBloc(getIt<MovieRepository>(), title),
        child: RewardScreen(),
      ),
    );
  }
}
