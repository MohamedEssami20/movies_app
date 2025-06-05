import 'package:flutter/material.dart';

import 'search_movies_details_and_photo.dart';

class SearchItems extends StatelessWidget {
  const SearchItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8),
      width: MediaQuery.sizeOf(context).width,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        color: Colors.transparent,
      ),
      child: SearchMoviesDetailsAndPhoto(),
    );
  }
}
