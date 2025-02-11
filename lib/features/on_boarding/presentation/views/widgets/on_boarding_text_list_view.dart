import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../manager/cubit/on_boarding_cubit.dart';

class OnBoardingTextListView extends StatelessWidget {
  const OnBoardingTextListView({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          onPageChanged: (value) {
            context.read<OnBoardingCubit>().changePage(value);
          },
          itemBuilder: (context, index) {
            return FittedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 14,
                children: [
                  FittedBox(
                    child: Text(
                      'Downloads',
                      style: AppTextStyles.medium32(context).copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                      'Download movies and watch them offline\n at your own convenience',
                      style: AppTextStyles.regular16(context).copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
