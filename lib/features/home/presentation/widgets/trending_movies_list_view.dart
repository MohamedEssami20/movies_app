import 'package:flutter/material.dart';
import 'package:movies_app/core/func/navigate_to_details_view.dart';
import '../../../../core/utils/api_end_points.dart';
import '../../domain/entities/trending_movies_entity.dart/trending_movies_entity.dart';
import 'movies_item.dart';

class TrendingMoviesListView extends StatelessWidget {
  const TrendingMoviesListView(
      {super.key,
      required this.trendingMoives,
      required this.scrollController});
  final List<TrendingMoviesEntity> trendingMoives;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 250,
        child: ListView.builder(
            key: PageStorageKey("TrendingMoviesListView"),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            controller: scrollController,
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: trendingMoives.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 12),
                child: GestureDetector(
                  onTap: () {
                    navigateToDetailsView(
                      context,
                      trendingMoives[index].movieId,
                    );
                  },
                  child: MoviesItem(
                    imageUrl: ApiEndPoints.imagebaseUrl +
                        trendingMoives[index].moviePoster.toString(),
                    movieTitle: trendingMoives[index].movieTitle,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
