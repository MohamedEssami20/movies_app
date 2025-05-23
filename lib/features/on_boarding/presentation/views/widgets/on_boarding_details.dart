import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/shared_pref_service.dart';
import 'package:movies_app/core/utils/app_color.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';
import 'package:movies_app/features/auth/presentation/manager/Auth_cubit/auth_cubit.dart';
import 'package:movies_app/features/auth/presentation/views/auth_view.dart';
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
        children: [
          Expanded(flex: 3, child: OnBoardingTextListView()),
          SizedBox(height: 16),
          Expanded(child: OnBoardingIndicator()),
          SizedBox(height: 16),
          Expanded(
            flex: 2,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                spacing: 32,
                children: [
                  CustomButton(
                    hasBorder: true,
                    color: Colors.transparent,
                    child: Text(
                      "Sign Up",
                      style: AppTextStyles.regular24(context)
                          .copyWith(color: Colors.white),
                    ),
                    onPressed: () async {
                      context.read<AuthCubit>().changeAuthState(0);
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AuthView.routeName,
                        (_) => false,
                        arguments: 0,
                      );
                      await SharedPrefService().setOnboardingShow(true);
                    },
                  ),
                  CustomButton(
                    hasBorder: false,
                    color: AppColors.kPrimaryColor,
                    child: Text(
                      "Login",
                      style: AppTextStyles.regular24(context)
                          .copyWith(color: Colors.white),
                    ),
                    onPressed: () async {
                      context.read<AuthCubit>().changeAuthState(1);
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AuthView.routeName,
                        (_) => false,
                        arguments: 1,
                      );
                      await SharedPrefService().setOnboardingShow(true);
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
