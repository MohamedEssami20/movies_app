import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/widgets/animated_text_cross_fading.dart';
import 'package:movies_app/features/auth/presentation/manager/Auth_cubit/auth_cubit.dart';
import 'package:movies_app/features/auth/presentation/views/widgets/animated_auth_form.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'animated_footer_auth.dart';
import 'auth_button.dart';
import 'auth_footer_item.dart';
import 'or_signup_and_login_with.dart';
import 'other_way_auth_listview.dart';

class AuthViewBody extends StatelessWidget {
  const AuthViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          spacing: 20,
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
            const SizedBox(
              height: 10,
            ),
            AuthButton(),
            const SizedBox(
              height: 8,
            ),
            OrSignupAndLoginWith(),
            const SizedBox(
              height: 12,
            ),
            OtherWayAuthListView(),
            AnimatedFooterAuth(),
            AuthFooterItem(),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
