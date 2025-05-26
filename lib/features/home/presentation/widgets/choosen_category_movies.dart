import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/widgets/movies_bloc_consumer/action_movies_bloc_consumer.dart';
import 'package:movies_app/features/home/presentation/widgets/movies_bloc_consumer/adventure_movies_bloc_consumer.dart';
import 'package:movies_app/features/home/presentation/widgets/movies_bloc_consumer/animations_movies_bloc_consumer.dart';
import 'package:movies_app/features/home/presentation/widgets/movies_bloc_consumer/drama_movies_bloc_consumer.dart';
import 'package:movies_app/features/home/presentation/widgets/movies_bloc_consumer/family_movies_bloc_consumer.dart';
import 'package:movies_app/features/home/presentation/widgets/movies_bloc_consumer/horror_movies_bloc_consumer.dart';
import 'package:movies_app/features/home/presentation/widgets/movies_bloc_consumer/romance_movies_bloc_consumer.dart';
import '../manager/categories_items/categories_items_cubit.dart';
import 'movies/all_category_movies.dart';
import 'movies_bloc_consumer/comedy_movies_bloc_consumer.dart';
import 'movies_bloc_consumer/crime_movies_bloc_consumer.dart';

class ChoosenCategoryViews extends StatefulWidget {
  const ChoosenCategoryViews({super.key});

  @override
  State<ChoosenCategoryViews> createState() => _ChoosenCategoryViewsState();
}

class _ChoosenCategoryViewsState extends State<ChoosenCategoryViews> {
  int _previousIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesItemsCubit, int>(
      builder: (context, state) {
        final bool isForward = state > _previousIndex;
        _previousIndex = state;

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (child, animation) {
            final offsetAnimation = Tween<Offset>(
              begin:
                  isForward ? const Offset(1.0, 0.0) : const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).animate(animation);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
          child: _buildCategoryView(state),
        );
      },
    );
  }

  Widget _buildCategoryView(int index) {
    switch (index) {
      case 0:
        return const AllCategories(key: ValueKey(0));
      case 1:
        return const ActionMoviesBlocConsumer(key: ValueKey(1));
      case 2:
        return const AdventureMoviesBlocConsumer(key: ValueKey(2));
      case 3:
        return const ComedyMoviesBlocConsumer(key: ValueKey(3));
      case 4:
        return const CrimeMoviesBlocConsumer(key: ValueKey(4));
      case 5:
        return const AnimationsMoviesBlocConsumer(key: ValueKey(5));
      case 6:
        return const DramaMoviesBlocConsumer(key: ValueKey(6));
      case 7:
        return const FamilyMoviesBlocConsumer(key: ValueKey(7));
      case 8:
        return const HorrorMoviesBlocConsumer(key: ValueKey(8));
      default:
        return const RomanceMoviesBlocConsumer(key: ValueKey(9));
    }
  }
}
