import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../manager/Auth_cubit/auth_cubit.dart';
import '../../manager/text_field_cubit/text_field_cubit.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.signupKey,
    required this.loginKey,
  });
  final GlobalKey<FormState> signupKey;
  final GlobalKey<FormState> loginKey;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final isSignup = context.read<AuthCubit>().isSignup;
          return FittedBox(
            fit: BoxFit.scaleDown,
            child: CustomButton(
              text: isSignup ? "Signup" : "Login",
              onPressed: () {
                if (isSignup) {
                  final isSignupvalidate = signupKey.currentState!.validate();
                  log("is signup validate= $isSignupvalidate");
                  if (isSignupvalidate) {
                    // final email = context.read<TextFieldCubit>().signupEmailController.text;
                    // final password =
                    //     context.read<TextFieldCubit>().signupPasswordController.text;
                    // await context.read<AuthCubit>().signup(
                    //       email: email,
                    //       password: password,
                    //     );
                    log("i am validate signup");
                  } else {
                    context.read<TextFieldCubit>().changeValidateSignupForm(
                        validateMode: AutovalidateMode.always);
                    log("not validte signup *****");
                  }
                  //sigupAtAuthButton(context, isSignupValid);
                } else {
                  final isLoginValidate = loginKey.currentState!.validate();
                  if (isLoginValidate) {
                    log("login validate");
                  } else {
                    context.read<TextFieldCubit>().changeValidateLoginForm(
                        validateMode: AutovalidateMode.always);
                    log("login not validate");
                  }
                }
              },
              hasBorder: false,
              color: AppColors.kPrimaryColor,
            ),
          );
        },
      ),
    );
  }
}
