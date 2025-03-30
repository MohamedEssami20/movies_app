import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/widgets/home_layout.dart';

import '../widgets/home_mobile_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeLayout(
        mobileLayout: (context) => HomeMobileLayout(),
        tabletLayout: (context) => SizedBox(),
        desktopLayout: (context) => SizedBox(),
      ),
    );
  }
}
