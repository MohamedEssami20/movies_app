import 'package:flutter/material.dart';
import 'package:movies_app/features/search/presentation/widgets/search_movies_bloc_consumer.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchMoviesBlocConsumer();
  }
}
