import 'package:flutter/material.dart';
import 'package:movies_app/core/func/navigate_to_details_view.dart';
import 'package:movies_app/features/home/domain/entities/romance_movies_entity/romance_movies_entity.dart';

import '../../../../../core/utils/api_end_points.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../movies_item.dart';

class RomanceMoviesView extends StatelessWidget {
  const RomanceMoviesView(
      {super.key, required this.romanceMovies, required this.scrollController});
  final List<RomanceMoviesEntity> romanceMovies;
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
                "Romance Movies",
                style: AppTextStyles.semiBold16(context)
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              key: PageStorageKey("RomanceMoviesListView"),
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
                        romanceMovies[index].movieId,
                      );
                    },
                    child: MoviesItem(
                      movieTitle: romanceMovies[index].movieTitle,
                      imageUrl: ApiEndPoints.imagebaseUrl +
                          romanceMovies[index].moviePoster.toString(),
                    ),
                  ),
                );
              },
              itemCount: romanceMovies.length,
            ),
          ),
        ],
      ),
    );
  }
}
