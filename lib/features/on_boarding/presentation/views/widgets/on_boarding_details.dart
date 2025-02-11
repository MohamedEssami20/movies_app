import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_color.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'on_boarding_indicator_listview.dart';
import 'on_boarding_text_list_view.dart';

class OnBoardingDetails extends StatelessWidget {
  const OnBoardingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          OnBoardingTextListView(),
          const SizedBox(height: 60),
          OnBoardingIndicator(),
          SizedBox(height: 60.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                hasBorder: true,
                color: Colors.transparent,
                text: "Signup",
                onPressed: () {},
              ),
              CustomButton(
                hasBorder: false,
                color: AppColors.kPrimaryColor,
                text: "Login",
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
