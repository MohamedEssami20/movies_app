import 'package:flutter/material.dart';

import '../../../domain/watch_list_entity/watch_list_entity.dart';
import 'watch_list_movie_item.dart';

class WatchListMoviesListView extends StatelessWidget {
  const WatchListMoviesListView({
    super.key,
    required this.movies,
  });
  final List<WatchListEntity> movies;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: GestureDetector(
              onTap: () {},
              child: WatchListMovieItem(
                movie: movies[index],
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}
