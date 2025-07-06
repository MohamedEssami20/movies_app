import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/app_color.dart';
import 'package:movies_app/core/widgets/custom_bottom_sheet.dart';
import 'package:movies_app/features/details_movies/domain/movies_details_entity/movies_details_entity.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../watch_list/presentation/manager/cubit/watch_list_movies_cubit.dart';
import 'custom_details_movies_button.dart';
import 'custom_trailer_movie.dart';

class WatchTrailerAndAddToWatchListButtons extends StatelessWidget {
  const WatchTrailerAndAddToWatchListButtons(
      {super.key, required this.moviesDetailsEntity});
  final MoviesDetailsEntity moviesDetailsEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: CustomDetailsMoviesButton(
            title: 'Watch Trailer',
            icon: SvgPicture.asset(
              Assets.assetsImagesVideoIcon,
              height: 20,
            ),
            color: Color(0xFF385A64),
            onPressed: () {
              showModalBottomSheet(
                enableDrag: false,
                context: context,
                isScrollControlled: true,
                backgroundColor: AppColors.kPrimaryColor,
                builder: (context) {
                  return CustomTrailerMovie();
                },
              );
            },
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: BlocListener<WatchListMoviesCubit, WatchListMoviesState>(
            listener: (context, state) {
              if (state is AddWatchListMoviesSuccess) {
                showAddedToWatchlistBottomSheet(
                  context,
                  moviesDetailsEntity.movieTitle,
                );
              }
            },
            child: CustomDetailsMoviesButton(
              title: 'Add to Watchlist',
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 20,
              ),
              color: Color(0xFF385A64),
              onPressed: () async {
                await context.read<WatchListMoviesCubit>().addMovieToWatchList(
                      docsId: moviesDetailsEntity.movieId,
                      data: moviesDetailsEntity.toFireStore(),
                    );
              },
            ),
          ),
        ),
      ],
    );
  }
}
