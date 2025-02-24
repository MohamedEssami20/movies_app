import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';
import 'package:movies_app/features/auth/presentation/manager/Auth_cubit/auth_cubit.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final isSignup = context.watch<AuthCubit>().isSignup;
        return Visibility(
          visible: !isSignup,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Forgot Password?',
                style: AppTextStyles.semiBold12(context).copyWith(
                  color: Colors.white,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        );
      },
    );
  }
}
