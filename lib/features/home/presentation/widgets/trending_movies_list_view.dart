import 'package:flutter/material.dart';

import 'trending_movies_item.dart';

class TrendingMoviesListView extends StatelessWidget {
  const TrendingMoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: 194,
        child: ListView.builder(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 16),
                child: TrendingMoviesItem(),
              );
            }),
      ),
    );
  }
}
