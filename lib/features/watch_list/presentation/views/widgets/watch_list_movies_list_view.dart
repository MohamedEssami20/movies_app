import 'package:flutter/material.dart';

import 'watch_list_movie_item.dart';

class WatchListMoviesListView extends StatelessWidget {
  const WatchListMoviesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: GestureDetector(
              onTap: () {
                
              },
              child: WatchListMovieItem(),
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
