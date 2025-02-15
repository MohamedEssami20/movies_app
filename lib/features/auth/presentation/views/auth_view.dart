import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_text_styles.dart';

import '../manager/Auth_cubit/auth_cubit.dart';
import 'widgets/auth_view_body.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});
  static const String routeName = "AuthView";

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.sizeOf(context).height * 0.18,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
          final index = context.watch<AuthCubit>();
          return Text(index.isSignup ? "Welcome" : "Welcome Back!");
        }),
        titleTextStyle:
            AppTextStyles.semiBold24(context).copyWith(color: Colors.white),
        elevation: 0.0,
        bottom: PreferredSize(
          preferredSize: Size(0, 0),
          child: Center(
            child: TabBar(
              onTap: (value) {
                context.read<AuthCubit>().changeAuthState(value);
              },
              indicatorColor: Colors.white,
              controller: tabController,
              dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.center,
              tabs: [
                Tab(
                  child: Text(
                    "Signup",
                    style: AppTextStyles.semiBold24(context)
                        .copyWith(color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    "Login",
                    style: AppTextStyles.semiBold24(context)
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: AuthViewBody(),
    );
  }
}
