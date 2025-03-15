  import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/manager/Auth_cubit/auth_cubit.dart';
import '../../features/auth/presentation/manager/text_field_cubit/text_field_cubit.dart';

void loginAtAuthButton(BuildContext context, bool isLoginValid) async {
  if (isLoginValid) {
    final email = context.read<TextFieldCubit>().loginEmailController.text;
    final password =
        context.read<TextFieldCubit>().loginPasswordController.text;
    await context.read<AuthCubit>().login(
          email: email,
          password: password,
        );
  } else {
    context
        .read<TextFieldCubit>()
        .changeValidateLoginForm(validateMode: AutovalidateMode.always);
    log("not validte login *****");
  }
}