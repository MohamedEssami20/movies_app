import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart' show AppTextStyles;

class MovieOverView extends StatelessWidget {
  const MovieOverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: null,
      overflow: TextOverflow.visible,
      'With the price on his head ever increasing, John Wick uncovers a path to defeating The High Table. But before he can earn his freedom, Wick must face off against a new enemy with powerful alliances across the globe and forces that turn old friends into foes.',
      style: AppTextStyles.regular16(context).copyWith(color: Colors.white),
    );
  }
}
