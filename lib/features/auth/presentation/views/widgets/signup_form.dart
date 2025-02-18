import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/func/validation_password.dart';
import 'package:movies_app/features/auth/presentation/manager/global_keys_cubit.dart/global_key_cubit.dart';
import '../../../../../core/func/validation_email.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../manager/text_field_cubit/text_field_cubit.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
        return Form(
          key: context.read<GlobalKeyCubit>().signupKey,
          child: Column(
            children: [
              CustomTextField(
                label: "Email",
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.emailAddress,
                obscureText: false,
                validate: (value) {
                  return validationEmail(value);
                },
              ),
              const SizedBox(height: 30),
              BlocBuilder<TextFieldCubit, TextFieldState>(
                builder: (context, state) {
                  final status =
                      context.read<TextFieldCubit>().ispasswordvisable;
                  return CustomTextField(
                    label: "Password",
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.visiblePassword,
                    obscureText:
                        context.read<TextFieldCubit>().ispasswordvisable,
                    suffix: IconButton(
                      onPressed: () {
                        context
                            .read<TextFieldCubit>()
                            .changePasswordVisability();
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
              const SizedBox(height: 30),
              BlocBuilder<TextFieldCubit, TextFieldState>(
                builder: (context, state) {
                  final status =
                      context.read<TextFieldCubit>().isConfirmpasswordvisable;
                  return CustomTextField(
                    label: "Confirm Password",
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.visiblePassword,
                    obscureText:
                        context.read<TextFieldCubit>().isConfirmpasswordvisable,
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
