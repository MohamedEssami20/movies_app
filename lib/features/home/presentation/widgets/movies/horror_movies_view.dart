import 'package:flutter/material.dart';
import 'package:movies_app/core/func/navigate_to_details_view.dart';
import 'package:movies_app/features/home/domain/entities/horror_movies_entity/horror_movies_entity.dart';

import '../../../../../core/utils/api_end_points.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../movies_item.dart';

class HorrorMoviesView extends StatelessWidget {
  const HorrorMoviesView(
      {super.key, required this.horrorMovies, required this.scrollController});
  final List<HorrorMoviesEntity> horrorMovies;
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
                "Horror Movies",
                style: AppTextStyles.semiBold16(context)
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              key: PageStorageKey("HorrorMoviesListView"),
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
                        horrorMovies[index].movieId,
                      );
                    },
                    child: MoviesItem(
                      movieTitle: horrorMovies[index].movieTitle,
                      imageUrl: ApiEndPoints.imagebaseUrl +
                          horrorMovies[index].moviePoster.toString(),
                    ),
                  ),
                );
              },
              itemCount: horrorMovies.length,
            ),
          ),
        ],
      ),
    );
  }
}
