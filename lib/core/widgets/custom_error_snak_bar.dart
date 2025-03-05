// create custom error snak bar
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_color.dart';

class CustomErrorSnackBar extends SnackBar {
  CustomErrorSnackBar({
    super.key,
    required String message,
  }) : super(
          content: Text(message),
          backgroundColor: AppColors.kPrimaryColor.withValues(alpha: 0.5),
          duration: const Duration(seconds: 2),
          action: SnackBarAction(
            label: "Ok",
            textColor: Colors.white,
            onPressed: () {},
          ),
          padding: EdgeInsets.all(16),
        );
}
