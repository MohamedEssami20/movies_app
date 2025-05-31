import 'package:flutter/material.dart';

import 'search_movies_details.dart';
import 'search_movies_photo.dart';

class SearchMoviesItem extends StatelessWidget {
  const SearchMoviesItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        SearchMoviesPhoto(),
        SearchMoviesDetails(),
      ],
    );
  }
}