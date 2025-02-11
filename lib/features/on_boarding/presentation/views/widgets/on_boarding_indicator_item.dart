import 'package:flutter/material.dart';

class OnBoardingIndicatorItem extends StatelessWidget {
  const OnBoardingIndicatorItem({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 6,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: isActive ? Color(0xFF8A0000) : Colors.white,
      ),
    );
  }
}
