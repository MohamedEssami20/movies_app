//create custom resposive button;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final bool hasBorder;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    required this.hasBorder,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 20.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        side: hasBorder ? BorderSide(width: 2, color: Colors.white) : null,
      ),
      child: Text(
        text,
        style: AppTextStyles.regular24(context).copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
