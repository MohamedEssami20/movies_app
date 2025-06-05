import 'package:animated_snack_bar/animated_snack_bar.dart' show AnimatedSnackBarType;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';
import 'package:movies_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:movies_app/features/search/presentation/widgets/search_movies_list_view.dart';

import '../../../../core/func/custom_snack_bar.dart' show showAnimatedSnackBar;

class SearchMoviesBlocConsumer extends StatelessWidget {
  const SearchMoviesBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchMoviesCubit, SearchMoviesState>(
        builder: (context, state) {
          if (state is SearchMoviesSuccess) {
            if(state.searchMovies.isEmpty){
              return Center(
                child: Text(
                  "No Movies Found",
                  style: AppTextStyles.medium16(context)
                      .copyWith(color: Colors.white),
                ),
              );
            }else{
              return SearchMoviesListView(searchMovies: state.searchMovies);
            }
          } else if (state is SearchMoviesFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: AppTextStyles.medium16(context)
                    .copyWith(color: Colors.white),
              ),
            );
          }
          else{
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          }
        },
        listener: (context, state) {
          if (state is SearchMoviesFailure) {
            showAnimatedSnackBar(
              context,
              message: state.errorMessage,
              type: AnimatedSnackBarType.error,
            );
          }
        },);
  }
}
