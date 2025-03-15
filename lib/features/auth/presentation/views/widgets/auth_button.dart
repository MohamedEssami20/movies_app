import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/func/login_at_auth_button.dart';
import '../../../../../core/func/signup_at_auth_button.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../manager/Auth_cubit/auth_cubit.dart';

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
                  sigupAtAuthButton(context, isSignupvalidate);
                } else {
                  final isLoginValidate = loginKey.currentState!.validate();
                  loginAtAuthButton(context, isLoginValidate);
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
