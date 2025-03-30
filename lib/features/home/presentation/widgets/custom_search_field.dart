import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/assets.dart';

import '../../../../core/utils/app_text_styles.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    required this.onChanged,
  });

  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyles.medium16(context).copyWith(
        color: Colors.white,
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: Colors.white),
        suffixIcon: SvgPicture.asset(
          Assets.assetsImagesFilterListIcon,
          fit: BoxFit.scaleDown,
        ),
        hintText: 'Search movies...',
        hintStyle: AppTextStyles.regular16(context).copyWith(
          color: Colors.white.withValues(alpha: 0.50),
        ),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(16),
      ),
    );
  }
}
