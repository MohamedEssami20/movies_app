import 'package:flutter/material.dart';

import '../../../../../core/utils/api_end_points.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../domain/entities/comedy_movies_entity/comedy_movies_entity.dart';
import '../movies_item.dart';

class ComedyMoviesView extends StatelessWidget {
  const ComedyMoviesView({super.key, required this.comedyMovies, required this.scrollController});
  final List<ComedyMoviesEntity> comedyMovies;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        spacing: 12,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Comedy Movies",
                style: AppTextStyles.semiBold16(context)
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              key: PageStorageKey("ComedyMoviesListView"),
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width > 600 ? 4 : 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return FittedBox(
                  fit: BoxFit.fill,
                  child: MoviesItem(
                    movieTitle: comedyMovies[index].movieTitle,
                    imageUrl: ApiEndPoints.imagebaseUrl +
                        comedyMovies[index].moviePoster.toString(),
                  ),
                );
              },
              itemCount: comedyMovies.length,
            ),
          ),
        ],
      ),
    );
  }
}
