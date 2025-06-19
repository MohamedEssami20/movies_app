import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movies_app/core/func/get_country_with_code.dart';

import 'movie_other_details_item.dart';

class MoviesOtherDetails extends StatelessWidget {
  const MoviesOtherDetails(
      {super.key,
      required this.orignalCountry,
      required this.genres,
      required this.productionCompanies,
      required this.relaseDate});
  final List<dynamic> orignalCountry;
  final List<String> genres, productionCompanies;
  final String relaseDate;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        MoviesOtherDetailsItem(
          title: 'country',
          subTitle: getCountryWithCode(orignalCountry),
        ),
        MoviesOtherDetailsItem(
          title: 'Genre',
          subTitle: getGenres(genres),
        ),
        MoviesOtherDetailsItem(
          title: 'Date Release',
          subTitle: getReleaseDate(relaseDate),
        ),
        MoviesOtherDetailsItem(
          title: 'Production',
          subTitle: productionCompanies[0],
        ),
      ],
    );
  }
}

String getGenres(List<String> genres) {
  if (genres.isNotEmpty) {
    return genres.take(2).join(', ');
  } else {
    return 'No Genres';
  }
}

// create method that take realse date as String and return it as date format MMMM d, y;
String getReleaseDate(String releaseDate) {
  try {
    final date = DateTime.parse(releaseDate);
    final formatter = DateFormat("MMMM d, y");
    return formatter.format(date);
  } catch (e) {
    return 'Unknown';
  }
}
