import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/details_movies/presentation/manager/movies_details_cubit/movies_details_cubit.dart';
import 'package:movies_app/features/search/presentation/widgets/search_view_body.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../details_movies/domain/repos/details_movies_repos.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesDetailsCubit(
        detailsMoviesRepos: getIt.get<DetailsMoviesRepos>(),
      ),
      child: SearchViewBody(),
    );
  }
}
