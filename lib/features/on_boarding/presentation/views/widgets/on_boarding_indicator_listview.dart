import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cubit/on_boarding_cubit.dart';
import 'on_boarding_indicator_item.dart';

class OnBoardingIndicator extends StatelessWidget {
  const OnBoardingIndicator({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, int>(
      builder: (context, state) {
        return Row(
          spacing: 24,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            3,
            (index) => OnBoardingIndicatorItem(
              isActive: state == index,
            ),
          ),
        );
      },
    );
  }
}
