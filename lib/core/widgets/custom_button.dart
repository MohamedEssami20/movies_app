//create custom resposive button;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? color;
  final bool hasBorder;
  final Widget? child;
  const CustomButton({
    super.key,
    required this.onPressed,
    this.color,
    required this.hasBorder,
    this.child,
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
      child: child,
    );
  }
}
