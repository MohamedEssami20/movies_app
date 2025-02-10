
// create method that returns route
import 'package:flutter/material.dart';
import 'package:movies_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:movies_app/features/splash/presentation/views/splash_view.dart';

Route<T>? onGenerateRoute<T>(RouteSettings settings){
  switch(settings.name){
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    default:
      return MaterialPageRoute(builder: (context) => const SplashView());
  }
}