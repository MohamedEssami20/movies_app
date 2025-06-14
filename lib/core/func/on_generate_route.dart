// create method that returns route
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/auth/presentation/views/auth_view.dart';
import 'package:movies_app/features/details_movies/presentation/manager/movies_details_cubit/movies_details_cubit.dart';
import 'package:movies_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:movies_app/features/splash/presentation/views/splash_view.dart';

import '../../features/details_movies/presentation/views/movies_details_view.dart'
    show MoviesDetailsView;
import '../../features/home/presentation/views/home_view.dart';

Route<T>? onGenerateRoute<T>(RouteSettings settings) {
  switch (settings.name) {
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case AuthView.routeName:
      final int initialIndex = settings.arguments as int? ?? 0;
      return MaterialPageRoute(
          builder: (context) => AuthView(
                initialIndex: initialIndex,
              ));
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case MoviesDetailsView.routeName:
      final detailsCubit = settings.arguments as MoviesDetailsCubit;
      return MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: detailsCubit,
          child: const MoviesDetailsView(),
        ),
      );
    default:
      return MaterialPageRoute(builder: (context) => const SplashView());
  }
}
