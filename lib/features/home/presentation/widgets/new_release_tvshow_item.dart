import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/assets.dart';

class NewReleaseTvShowItem extends StatelessWidget {
  const NewReleaseTvShowItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Image.asset(
          Assets.assetsImagesFilmImage,
          fit: BoxFit.scaleDown,
        ),
        Text(
          'Medelline  2023',
          style:
              AppTextStyles.semiBold12(context).copyWith(color: Colors.white),
        ),
      ],
    );
  }
}