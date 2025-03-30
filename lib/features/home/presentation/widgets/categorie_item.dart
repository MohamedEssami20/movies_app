import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';

class CategorieItem extends StatelessWidget {
  const CategorieItem({super.key, required this.title, this.icon});
  final String title;
  final IconData? icon;
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
          Icon(icon, color: Colors.white,),
          Text(
            title,
            style:AppTextStyles.regular16(context).copyWith(color: Colors.white,),
          ),
          
        ],
      ),
    );
  }
}