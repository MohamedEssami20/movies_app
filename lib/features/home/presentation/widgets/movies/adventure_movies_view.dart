import 'package:flutter/material.dart';
import 'package:movies_app/features/home/domain/entities/adventure_movies_entity/adventure_movies_entity.dart';

import '../../../../../core/func/navigate_to_details_view.dart';
import '../../../../../core/utils/api_end_points.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../movies_item.dart';

class AdventureMoviesView extends StatelessWidget {
  const AdventureMoviesView(
      {super.key,
      required this.adventureMovies,
      required this.scrollController});
  final List<AdventureMoviesEntity> adventureMovies;
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
                "Adventure Movies",
                style: AppTextStyles.semiBold16(context)
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              key: PageStorageKey("AdventureMoviesListView"),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                        adventureMovies[index].movieId,
                      );
                    },
                    child: MoviesItem(
                      imageUrl: ApiEndPoints.imagebaseUrl +
                          adventureMovies[index].moviePoster.toString(),
                      movieTitle: adventureMovies[index].movieTitle,
                    ),
                  ),
                );
              },
              itemCount: adventureMovies.length,
            ),
          ),
        ],
      ),
    );
  }
}
