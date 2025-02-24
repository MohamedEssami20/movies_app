import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/auth/presentation/manager/Auth_cubit/auth_cubit.dart';

import '../../../../../core/utils/app_text_styles.dart';

class AuthFooterItem extends StatelessWidget {
  const AuthFooterItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final isSignup = context.watch<AuthCubit>().isSignup;
        return Visibility(
          visible: isSignup,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'By signing into MovieFlix you agree to our',
                  style: AppTextStyles.regular16(context).copyWith(
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: ' \nTerms of Service ',
                  style: AppTextStyles.semiBold16(context).copyWith(
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: 'and',
                  style: AppTextStyles.regular16(context).copyWith(
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: ' Privacy Policy',
                  style: AppTextStyles.semiBold16(context).copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
