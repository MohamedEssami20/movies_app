import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../manager/cubit/on_boarding_cubit.dart';

class OnBoardingTextListView extends StatelessWidget {
  const OnBoardingTextListView({super.key});
  @override

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: SizedBox(
        height: 180,
        width: MediaQuery.sizeOf(context).width,
        child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            onPageChanged: (value) {
             context.read<OnBoardingCubit>().changePage(value); 
            },
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Text(
                    'Downloads',
                    style: AppTextStyles.medium32(context).copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Download movies and watch them offline\nat your own convenience',
                    style: AppTextStyles.regular16(context).copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
