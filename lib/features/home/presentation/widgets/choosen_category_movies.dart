import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/categories_items/categories_items_cubit.dart';
import 'movies/action_movies_view.dart';
import 'movies/adventure_movies_view.dart';
import 'movies/all_category_movies.dart';
import 'movies/animation_movies_view.dart';
import 'movies/comedy_movies_view.dart';
import 'movies/crime_movies_view.dart';
import 'movies/drama_movies_view.dart';
import 'movies/family_movies_view.dart';
import 'movies/horror_movies_view.dart';
import 'movies/romance_movies_view.dart';

class ChoosenCategoryViews extends StatelessWidget {
  const ChoosenCategoryViews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesItemsCubit, int>(
      builder: (context, state) {
        switch (state) {
          case 0:
            return AllCategories();
          case 1:
            return ActionMoviesView();
          case 2:
            return AdventureMoviesView();
          case 3:
            return ComedyMoviesView();
          case 4:
            return CrimeMoviesView();
          case 5:
            return AnimationMoviesView();
          case 6:
            return DramaMoviesView();
          case 7:
            return FamilyMoviesView();
          case 8:
            return HorrorMoviesview();
          default:
            return RomanceMoviesView();
        }
      },
    );
  }
}