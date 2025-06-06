import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../manager/Auth_cubit/auth_cubit.dart';
import '../auth_view.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: AppTextStyles.regular16(context).copyWith(color: Colors.white),
        ),
        TextButton(
          onPressed: () {
            context.read<AuthCubit>().changeAuthState(1);
            Navigator.pushNamedAndRemoveUntil(
                context, AuthView.routeName, (_) => false,
                arguments: 1);
          },
          child: Text(
            "Login",
            style: AppTextStyles.semiBold16(context).copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
