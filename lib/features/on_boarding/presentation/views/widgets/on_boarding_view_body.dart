import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/on_boarding/presentation/manager/cubit/on_boarding_cubit.dart';
import '../../../../../core/utils/assets.dart';
import 'on_boarding_details.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            Assets.assetsImagesOnBoardingBackground2,
            fit: BoxFit.fill,
          ),
        ),
        Positioned.fill(
          top: MediaQuery.sizeOf(context).height * 0.60,
          child: BlocProvider(
            create: (context) => OnBoardingCubit(),
            child: OnBoardingDetails(),
          ),
        ),
      ],
    );
  }
}
