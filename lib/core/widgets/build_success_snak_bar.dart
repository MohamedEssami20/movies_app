// create custom error snak bar
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_color.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';

// create method that returns snak bar;

void buildSuccessSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      width: MediaQuery.sizeOf(context).width,
      content: Text(
        message,
        style: AppTextStyles.regular16(context).copyWith(
          color: Colors.white,
        ),
      ),
      backgroundColor: AppColors.kPrimaryColor,
      duration: const Duration(
        seconds: 3,
      ),
      action: SnackBarAction(
        label: "Dismiss",
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
