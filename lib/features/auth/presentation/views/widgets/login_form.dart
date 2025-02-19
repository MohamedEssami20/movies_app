import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/func/validation_password.dart';
import 'package:movies_app/features/auth/presentation/manager/global_keys_cubit.dart/global_key_cubit.dart';
import '../../../../../core/func/validation_email.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../manager/text_field_cubit/text_field_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<GlobalKeyCubit>().loginKey,
      child: Column(
        spacing: 30,
        children: [
          const SizedBox(
            height: 0,
          ),
          CustomTextField(
            label: "Email",
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.emailAddress,
            obscureText: false,
            validate: (value) {
              return validationEmail(value);
            },
          ),
          BlocBuilder<TextFieldCubit, TextFieldState>(
            builder: (context, state) {
              final status =
                  context.read<TextFieldCubit>().isLoginpasswordvisable;
              return CustomTextField(
                label: "Password",
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.visiblePassword,
                obscureText:
                    context.read<TextFieldCubit>().isLoginpasswordvisable,
                suffix: IconButton(
                  onPressed: () {
                    context.read<TextFieldCubit>().changePasswordVisability();
                  },
                  icon: Icon(
                    status ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                ),
                validate: (value) {
                  return validationPassword(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
