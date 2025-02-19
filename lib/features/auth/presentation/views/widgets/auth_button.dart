import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/auth/presentation/manager/text_field_cubit/text_field_cubit.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../manager/Auth_cubit/auth_cubit.dart';

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
                    context.read<TextFieldCubit>().validateSignupForm();
                if (isSignupValid) {
                  log("validate signup *****");
                } else {
                  context.read<TextFieldCubit>().changeValidateSignupForm(
                      validateMode: AutovalidateMode.always);
                  log("not validte signup *****");
                }
              } else {
                final isLoginValid =
                    context.read<TextFieldCubit>().validateLoginForm();
                if (isLoginValid) {
                  log("validate login *****");
                } else {
                  context.read<TextFieldCubit>().changeValidateLoginForm(
                      validateMode: AutovalidateMode.always);
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
