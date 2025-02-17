import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
