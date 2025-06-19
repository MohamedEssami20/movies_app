import 'package:flutter/material.dart';
import 'package:movies_app/core/func/navigate_to_details_view.dart';
import 'package:movies_app/features/home/domain/entities/drama_movies_entity/drama_movies_entity.dart';

import '../../../../../core/utils/api_end_points.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../movies_item.dart';

class DramaMoviesView extends StatelessWidget {
  const DramaMoviesView(
      {super.key, required this.dramaMovies, required this.scrollController});
  final List<DramaMoviesEntity> dramaMovies;
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
                "Drama Movies",
                style: AppTextStyles.semiBold16(context)
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              key: PageStorageKey("DramaMoviesListView"),
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
                  child: GestureDetector(
                    onTap: () {
                      navigateToDetailsView(
                        context,
                        dramaMovies[index].movieId,
                      );
                    },
                    child: MoviesItem(
                      movieTitle: dramaMovies[index].movieTitle,
                      imageUrl: ApiEndPoints.imagebaseUrl +
                          dramaMovies[index].moviePoster.toString(),
                    ),
                  ),
                );
              },
              itemCount: dramaMovies.length,
            ),
          ),
        ],
      ),
    );
  }
}
