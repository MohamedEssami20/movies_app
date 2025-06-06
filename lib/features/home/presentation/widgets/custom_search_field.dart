import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/assets.dart';

import '../../../../core/utils/app_text_styles.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    required this.onChanged,
    this.onTap,
    this.onSubmitted,
  });

  final ValueChanged<String?> onChanged;
  final void Function()? onTap;
  final void Function(String?)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyles.medium16(context).copyWith(
        color: Colors.white,
      ),
      validator: (value) => value!.isEmpty ? 'Enter movie name' : null,
      onChanged: onChanged,
      onTap: onTap,
      onFieldSubmitted: onSubmitted,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: Colors.white),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: SvgPicture.asset(
            Assets.assetsImagesFilterListIcon,
            fit: BoxFit.scaleDown,
          ),
        ),
        hintText: 'Search movies...',
        hintStyle: AppTextStyles.regular16(context).copyWith(
          color: Colors.white.withValues(alpha: 0.50),
        ),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        errorBorder: buildBorder(Colors.red),
        focusedErrorBorder: buildBorder(),
        errorStyle:
            AppTextStyles.regular16(context).copyWith(color: Colors.red),
      ),
    );
  }

  OutlineInputBorder buildBorder([Color? color]) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(16),
      ),
    );
  }
}
