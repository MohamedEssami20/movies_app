import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/details_movies/presentation/views/widgets/layout/movies_details_mobile.dart';
import '../../../manager/movies_details_cubit/movies_details_cubit.dart';

class MoviesDetailsMobileBlocConsumer extends StatelessWidget {
  const MoviesDetailsMobileBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesDetailsCubit, MoviesDetailsState>(
      builder: (context, state) {
        if (state is MoviesDetailsSuccess || state is MoviesDetailsLoading) {
          return MoviesDetailsMobile();
        } else if (state is MoviesDetailsFailure) {
          return Center(
            child: Text(
              "${state.errorMessage.toString()}😢",
            ),
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircularProgressIndicator(
                  color: Colors.blueAccent.shade400,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
