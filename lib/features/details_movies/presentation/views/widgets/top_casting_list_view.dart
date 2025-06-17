import 'package:flutter/material.dart';
import 'package:movies_app/features/details_movies/domain/movies_details_entity/movies_casting_entity.dart';

import 'top_cast_items.dart';

class TopCastingListView extends StatelessWidget {
  const TopCastingListView({super.key, required this.moviesCasting});
  final List<MoviesCastingEntity> moviesCasting;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        shrinkWrap: true,
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: moviesCasting.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 12),
            child: TopCastItems(
              castImage: moviesCasting[index].castpProfilePath,
              castTiltle: moviesCasting[index].castName,
            ),
          );
        },
      ),
    );
  }
}
