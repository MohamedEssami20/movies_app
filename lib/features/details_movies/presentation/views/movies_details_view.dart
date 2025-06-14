import 'package:flutter/material.dart';
import 'package:movies_app/features/details_movies/presentation/views/widgets/bloc_consumer/movies_details_bloc_builder_mobile.dart';
import 'package:movies_app/features/details_movies/presentation/views/widgets/movies_details_layout.dart';
import 'widgets/layout/movies_details_tablet.dart';

class MoviesDetailsView extends StatelessWidget {
  const MoviesDetailsView({super.key});
  static const routeName = 'movies_details';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MoviesDetailsLayout(
        mobileLayout: (context) => MoviesDetailsMobileBlocConsumer(),
        tabletLayout: (context) => const MoviesDetailsTablet(),
        desktopLayout: (context) => const SizedBox(),
      ),
    );
  }
}
