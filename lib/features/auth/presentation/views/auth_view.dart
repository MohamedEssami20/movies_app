import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';

import 'widgets/auth_view_body.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});
  static const String routeName = "AuthView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Welcome"),
        titleTextStyle:
            AppTextStyles.semiBold24(context).copyWith(color: Colors.white),
        elevation: 0.0,
      ),
      body: AuthViewBody(),
    );
  }
}
