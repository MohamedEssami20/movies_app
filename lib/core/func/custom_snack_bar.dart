import 'package:flutter/material.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:movies_app/core/utils/app_color.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';

void showAnimatedSnackBar(
  BuildContext context, {
  required String message,
  required AnimatedSnackBarType type,
  Duration duration = const Duration(seconds: 3),
  DesktopSnackBarPosition desktopPosition =
      DesktopSnackBarPosition.bottomCenter,
  MobileSnackBarPosition mobilePosition = MobileSnackBarPosition.bottom,
  Curve animationCurve = Curves.easeInOut,
  Duration animationDuration = const Duration(milliseconds: 500),
}) {
  AnimatedSnackBar(
      desktopSnackBarPosition: desktopPosition,
      mobileSnackBarPosition: mobilePosition,
      animationCurve: animationCurve,
      animationDuration: animationDuration,
      duration: duration,
      builder: (context) {
        return MaterialAnimatedSnackBar(
          messageText: message,
          type: type,
          backgroundColor: AppColors.kPrimaryColor,
          titleTextStyle:
              AppTextStyles.regular16(context).copyWith(color: Colors.white),
          messageTextStyle:
              AppTextStyles.regular16(context).copyWith(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        );
      }).show(context);
}
