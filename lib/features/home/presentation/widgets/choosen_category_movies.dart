// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../manager/categories_items/categories_items_cubit.dart';
// import 'movies/action_movies_view.dart';
// import 'movies/adventure_movies_view.dart';
// import 'movies/all_category_movies.dart';
// import 'movies/animation_movies_view.dart';
// import 'movies/comedy_movies_view.dart';
// import 'movies/crime_movies_view.dart';
// import 'movies/drama_movies_view.dart';
// import 'movies/family_movies_view.dart';
// import 'movies/horror_movies_view.dart';
// import 'movies/romance_movies_view.dart';

// class ChoosenCategoryViews extends StatelessWidget {
//   const ChoosenCategoryViews({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CategoriesItemsCubit, int>(
//       builder: (context, state) {
//         switch (state) {
//           case 0:
//             return AllCategories();
//           case 1:
//             return ActionMoviesView();
//           case 2:
//             return AdventureMoviesView();
//           case 3:
//             return ComedyMoviesView();
//           case 4:
//             return CrimeMoviesView();
//           case 5:
//             return AnimationMoviesView();
//           case 6:
//             return DramaMoviesView();
//           case 7:
//             return FamilyMoviesView();
//           case 8:
//             return HorrorMoviesview();
//           default:
//             return RomanceMoviesView();
//         }
//       },
//     );
//   }
// }

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
              begin: isForward ? const Offset(1.0, 0.0) : const Offset(-1.0, 0.0),
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
        return const ActionMoviesView(key: ValueKey(1));
      case 2:
        return const AdventureMoviesView(key: ValueKey(2));
      case 3:
        return const ComedyMoviesView(key: ValueKey(3));
      case 4:
        return const CrimeMoviesView(key: ValueKey(4));
      case 5:
        return const AnimationMoviesView(key: ValueKey(5));
      case 6:
        return const DramaMoviesView(key: ValueKey(6));
      case 7:
        return const FamilyMoviesView(key: ValueKey(7));
      case 8:
        return const HorrorMoviesview(key: ValueKey(8));
      default:
        return const RomanceMoviesView(key: ValueKey(9));
    }
  }
}

