import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/func/validation_password.dart';
import '../../../../../core/func/validation_email.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../manager/text_field_cubit/text_field_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextFieldCubit, TextFieldState>(
      builder: (context, state) {
        return Form(
          autovalidateMode: state.loginValidateMode,
          key: context.read<TextFieldCubit>().loginKey,
          child: Column(
            spacing: 30,
            children: [
              const SizedBox(
                height: 0,
              ),
              CustomTextField(
                controller: context.read<TextFieldCubit>().loginEmailController,
                label: "Email",
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.emailAddress,
                obscureText: false,
                validate: (value) {
                  return validationEmail(value);
                },
              ),
              CustomTextField(
                controller: context.read<TextFieldCubit>().loginPasswordController,
                label: "Password",
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.visiblePassword,
                obscureText: state.isLoginPasswordVisiable,
                suffix: IconButton(
                  onPressed: () {
                    context.read<TextFieldCubit>().changeVisiableLoginPassword(
                        isVisiable: !state.isLoginPasswordVisiable);
                  },
                  icon: Icon(
                    state.isLoginPasswordVisiable
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.white,
                  ),
                ),
                validate: (value) {
                  return validationPassword(value, context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
