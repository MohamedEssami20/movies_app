import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/widgets/movies_bloc_consumer/top_rating_movies_bloc_consumer.dart';
import 'package:movies_app/features/home/presentation/widgets/movies_bloc_consumer/trending_movies_bloc_consumer.dart';
import 'package:movies_app/features/home/presentation/widgets/movies_bloc_consumer/up_coming_movies_bloc_consumer.dart';
import '../movies_bloc_consumer/popular_movies_bloc_consumer.dart';
import '../now_playing.dart';
import '../title_of_categorie.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NowPlaying(),
          const TitleOfCategorie(
            title: 'Popular',
          ),
          SizedBox(
            height: 12,
          ),
          PopularMoviesBlocConsumer(),
          const TitleOfCategorie(
            title: 'Trending',
          ),
          SizedBox(
            height: 12,
          ),
          TrendingMoviesBlocConsumer(),
          const TitleOfCategorie(
            title: 'Top Rating',
          ),
          SizedBox(
            height: 12,
          ),
          TopRatingMoviesBlocConsumer(),
          const TitleOfCategorie(
            title: 'Upcoming',
          ),
          SizedBox(
            height: 12,
          ),
          UpComingMoviesBlocConsumer(),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
