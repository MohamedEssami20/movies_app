import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_color.dart';
import 'package:movies_app/features/details_movies/presentation/manager/movies_details_cubit/movies_details_cubit.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'bottom_sheet_watch_trailer_body.dart';

class CustomTrailerMovie extends StatefulWidget {
  const CustomTrailerMovie(
      {super.key,
      required this.movieId,
      required this.movieName,
      required this.movieOverview});
  final int movieId;
  final String movieName, movieOverview;
  @override
  State<CustomTrailerMovie> createState() => _CustomTrailerMovieState();
}

class _CustomTrailerMovieState extends State<CustomTrailerMovie>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;
  @override
  void initState() {
    super.initState();
    getTrailer();
    _initAnimation();
  }

  // create method that implement animation Conrtroller;
  void _initAnimation() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  void getTrailer() async {
    await context.read<MoviesDetailsCubit>().getMoviesTrailer(
          movieId: widget.movieId,
        );
  }

  @override
  void dispose() {
    _controller.reverse();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.6,
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: Container(
            decoration: ShapeDecoration(
              color: AppColors.kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: BlocBuilder<MoviesDetailsCubit, MoviesDetailsState>(
              builder: (context, state) {
                if (state is MoviesTraillerSuccess) {
                  return WatchTrailerBottomSheetBody(
                    movieTrailerEntity: state.movieTrailerEntity,
                    movieName: widget.movieName,
                    movieOverview: widget.movieOverview,
                  );
                } else if (state is MoviesTraillerFailure) {
                  return Center(
                    child: Text(
                      state.errorMessage.toString(),
                      style: AppTextStyles.regular16(context)
                          .copyWith(color: Colors.white),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
