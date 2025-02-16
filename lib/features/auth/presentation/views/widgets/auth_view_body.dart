import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/widgets/custom_text_field.dart';
import 'package:movies_app/features/auth/presentation/manager/Auth_cubit/auth_cubit.dart';

import '../../../../../core/utils/app_text_styles.dart';

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
          CustomTextField(
            label: "Password",
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.visiblePassword,
            obscureText: true,
            suffix: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.remove_red_eye_outlined,
                color: Colors.white,
              ),
            ),
            validate: (value) {},
          ),
          const SizedBox(height: 30),
          CustomTextField(
            label: "confirm Password",
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            obscureText: true,
            validate: (value) {},
            suffix: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.remove_red_eye_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
