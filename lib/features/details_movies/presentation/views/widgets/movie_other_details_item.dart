import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart' show AppTextStyles;

class MoviesOtherDetailsItem extends StatelessWidget {
  const MoviesOtherDetailsItem({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$title     : ",
          style: AppTextStyles.regular16(context).copyWith(color: Colors.white),
        ),
        Text(
          subTitle,
          style: AppTextStyles.regular16(context).copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
