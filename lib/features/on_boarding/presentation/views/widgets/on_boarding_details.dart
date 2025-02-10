import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class OnBoardingDetails extends StatelessWidget {
  const OnBoardingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Downloads',
            style: AppTextStyles.medium32(context).copyWith(
              color: Colors.white,
            ),
          ),
          Text(
            'Download movies and watch them offline\nat your own convenience',
            style: AppTextStyles.regular16(context).copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
