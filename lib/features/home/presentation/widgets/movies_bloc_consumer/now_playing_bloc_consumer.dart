import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/manager/movies_cubit/movies_cubit.dart';
import 'package:movies_app/features/home/presentation/widgets/now_playing.dart';

import '../../../../../core/utils/custom_error_snack_bar.dart';

class NowPlayingBlocConsumer extends StatelessWidget {
  const NowPlayingBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoviesCubit, MoviesState>(
      builder: (context, state) {
        if (state is NowPlayingMoviesSuccess) {
          return NowPlaying(nowPlayingEntity: state.nowPlayingEntity);
        } else if (state is NowPlayingMoviesFailure) {
          return Center(
            child: Text(
              state.errorMessage.toString(),
            ),
          );
        } 
        else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
      
      },
      listener: (context, state){
        if(state is NowPlayingMoviesFailure){
          ScaffoldMessenger.of(context).showSnackBar(
            customErrorSnackBar(
              context,
              state.errorMessage.toString(),
            ),
          );
        }
      },
    );
  }
}
