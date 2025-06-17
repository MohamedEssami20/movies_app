import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart' show AppTextStyles;

class MovieOverView extends StatelessWidget {
  const MovieOverView({super.key, required this.movieOverView});
  final String movieOverView;
  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: null,
      overflow: TextOverflow.visible,
        movieOverView,
      style: AppTextStyles.regular16(context).copyWith(color: Colors.white),
    );
  }
}
