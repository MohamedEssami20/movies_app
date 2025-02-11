import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingIndicatorItem extends StatelessWidget {
  const OnBoardingIndicatorItem({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 8.h,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: isActive ? Color(0xFF8A0000) : Colors.white,
      ),
    );
  }
}
