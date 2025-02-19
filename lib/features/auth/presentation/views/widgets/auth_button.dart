import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../manager/Auth_cubit/auth_cubit.dart';
import '../../manager/global_keys_cubit.dart/global_key_cubit.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final isSignup = context.read<AuthCubit>().isSignup;
          return CustomButton(
            text: isSignup ? "Signup" : "Login",
            onPressed: () {
              log("isSignup: $isSignup");
              
              if (isSignup) {
                final isSignupValid =
                  context.read<GlobalKeyCubit>().validateSignupForm();
                if (isSignupValid) {
                  log("validate signup *****");
                } else {
                  log("not validte signup *****");
                }
              } else {
                final isLoginValid =
                  context.read<GlobalKeyCubit>().validateLoginForm();
                if (isLoginValid) {
                  log("validate login *****");
                } else {
                  log("not validte login *****");
                }
              }
            },
            hasBorder: false,
            color: AppColors.kPrimaryColor,
          );
        },
      ),
    );
  }
}

