import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class MoviesTypeItemDetails extends StatelessWidget {
  const MoviesTypeItemDetails({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          Text(title, style: AppTextStyles.regular16(context)),
        ],
      ),
    );
  }
}