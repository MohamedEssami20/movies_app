import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/auth/presentation/manager/Auth_cubit/auth_cubit.dart';
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
            
            const SizedBox(height: 30),
            AuthButton(),
          ],
        ),
      ),
    );
  }
}
