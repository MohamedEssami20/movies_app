import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/animated_text_cross_fading.dart';
import 'package:movies_app/features/home/data/models/categories_model.dart';

import '../../../../core/utils/app_text_styles.dart';

class CategorieItem extends StatelessWidget {
  const CategorieItem({
    super.key,
    required this.categoriesModel,
    required this.isSelected,
  });
  final CategoriesModel categoriesModel;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.30, color: Colors.white),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8,
        children: [
          if (categoriesModel.icon != null)
            Icon(
              categoriesModel.icon,
              color: Colors.white,
            ),
          AnimatedTextCrossFading(
            crossFadeState: isSelected
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstText: categoriesModel.title,
            secondText: categoriesModel.title,
            firstTextStyle: AppTextStyles.regular16(context).copyWith(
              color: Colors.white,
            ),
            secondTextStyle: AppTextStyles.regular16(context).copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
