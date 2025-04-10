import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_text_styles.dart';

SnackBar customErrorSnackBar(BuildContext context, String message) {
  return SnackBar(
    content: Text(
      message,
      style: AppTextStyles.regular16(context).copyWith(color: Colors.white),
    ),
    backgroundColor: AppColors.kPrimaryColor,
    duration: const Duration(seconds: 3),
    action: SnackBarAction(
      label: "Dismiss",
      textColor: Colors.white,
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );
}
