import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_color.dart';
import 'package:movies_app/core/widgets/custom_button.dart';
import 'package:movies_app/core/widgets/custom_text_field.dart';
import 'package:movies_app/features/auth/presentation/manager/Auth_cubit/auth_cubit.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../manager/text_field_cubit/text_field_cubit.dart';

class AuthViewBody extends StatelessWidget {
  const AuthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(
        children: [
          Center(
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                final isSignup = context.watch<AuthCubit>().isSignup;
                return Text(
                  isSignup
                      ? 'Please register for an account '
                      : 'Please login to your account',
                  style: AppTextStyles.regular16(context)
                      .copyWith(color: Colors.white),
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          CustomTextField(
            label: "Email",
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.emailAddress,
            obscureText: false,
            validate: (value) {},
          ),
          const SizedBox(height: 30),
          BlocBuilder<TextFieldCubit, TextFieldState>(
            builder: (context, state) {
              final status = context.read<TextFieldCubit>().ispasswordvisable;
              return CustomTextField(
                label: "Password",
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.visiblePassword,
                obscureText: context.read<TextFieldCubit>().ispasswordvisable,
                suffix: IconButton(
                  onPressed: () {
                    context.read<TextFieldCubit>().changePasswordVisability();
                  },
                  icon: Icon(
                    status ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                ),
                validate: (value) {},
              );
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<TextFieldCubit, TextFieldState>(
            builder: (context, state) {
              final status =
                  context.read<TextFieldCubit>().isConfirmpasswordvisable;
              return BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  final isLogin = context.watch<AuthCubit>().isSignup;
                  return Visibility(
                    visible: isLogin,
                    child: CustomTextField(
                      label: "Confirm Password",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.visiblePassword,
                      obscureText: context
                          .read<TextFieldCubit>()
                          .isConfirmpasswordvisable,
                      suffix: IconButton(
                        onPressed: () {
                          context
                              .read<TextFieldCubit>()
                              .changeConfirmPasswordVisability();
                        },
                        icon: Icon(
                          status ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white,
                        ),
                      ),
                      validate: (value) {},
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 30),
          AuthButton(),
        ],
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: BlocBuilder<AuthCubit,AuthState>(
        builder: (context, state) {
          final isSignup = context.watch<AuthCubit>().isSignup;
          return CustomButton(
            text:isSignup? "Signup":"Login",
            onPressed: () {},
            hasBorder: false,
            color: AppColors.kPrimaryColor,
          );
        },
      ),
    );
  }
}
