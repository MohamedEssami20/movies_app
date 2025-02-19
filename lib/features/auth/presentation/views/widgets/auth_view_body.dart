import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/widgets/animated_text_cross_fading.dart';
import 'package:movies_app/features/auth/presentation/manager/Auth_cubit/auth_cubit.dart';
import 'package:movies_app/features/auth/presentation/views/widgets/animated_auth_form.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../manager/global_keys_cubit.dart/global_key_cubit.dart';
import 'auth_button.dart';

class AuthViewBody extends StatelessWidget {
  const AuthViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalKeyCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          spacing: 30,
          children: [
            Center(
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  final isSignup = context.watch<AuthCubit>().isSignup;
                  return AnimatedTextCrossFading(
                    crossFadeState: isSignup
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstText: "Please register for an account",
                    secondText: "Please login to your account",
                    firstTextStyle: AppTextStyles.regular16(context)
                        .copyWith(color: Colors.white),
                    secondTextStyle: AppTextStyles.regular16(context)
                        .copyWith(color: Colors.white),
                  );
                },
              ),
            ),
            AnimatedAuthForm(),
            AuthButton(),
          ],
        ),
      ),
    );
  }
}
