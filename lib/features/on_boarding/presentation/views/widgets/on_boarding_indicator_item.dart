import 'package:flutter/material.dart';

class OnBoardingIndicatorItem extends StatelessWidget {
  const OnBoardingIndicatorItem({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width < 700 ? 50 : 80,
      height: width < 700 ? 6 : 8,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: isActive ? Color(0xFF8A0000) : Colors.white,
      ),
    );
  }
}
