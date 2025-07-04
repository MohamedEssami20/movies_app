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
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25, top: 20),
      child: width < 800
          ? ListView.builder(
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
            )
          : GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: const BouncingScrollPhysics(),
              controller: ScrollController(),
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                childAspectRatio: width < 900 ? 2.5 : 3.5,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: WatchListMovieItem(
                    movie: movies[index],
                  ),
                );
              },
              itemCount: movies.length,
            ),
    );
  }
}
