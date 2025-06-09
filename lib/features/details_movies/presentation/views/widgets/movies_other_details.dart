import 'package:flutter/material.dart';

import 'movie_other_details_item.dart';

class MoviesOtherDetails extends StatelessWidget {
  const MoviesOtherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        MoviesOtherDetailsItem(
          title: 'country',
          subTitle: 'United States',
        ),
        MoviesOtherDetailsItem(
          title: 'Genre',
          subTitle: 'Action, Crime, Thriller',
        ),
        MoviesOtherDetailsItem(
          title: 'Date Release',
          subTitle: 'May 4, 2012',
        ),
        MoviesOtherDetailsItem(
          title: 'Production',
          subTitle: 'AMC Studios',
        ),
      ],
    );
  }
}
