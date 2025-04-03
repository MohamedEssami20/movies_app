import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';

class TitleOfCategorie extends StatelessWidget {
  const TitleOfCategorie({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28, left: 20, right: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:
                AppTextStyles.semiBold16(context).copyWith(color: Colors.white),
          ),
          Text(
            'View all',
            style:
                AppTextStyles.regular12(context).copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
