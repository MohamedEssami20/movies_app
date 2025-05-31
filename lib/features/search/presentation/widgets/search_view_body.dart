
import 'package:flutter/material.dart';
import 'search_movies_item.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25),
      child: Container(
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
        child: SearchMoviesItem(),
      ),
    );
  }
}

