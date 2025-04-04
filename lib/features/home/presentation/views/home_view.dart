import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:movies_app/features/home/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:movies_app/features/home/presentation/widgets/home_layout.dart';
import 'package:movies_app/features/home/presentation/widgets/layouts/home_tablet_layout.dart';
import '../widgets/layouts/home_mobile_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: HomeLayout(
        mobileLayout: (context) => HomeMobileLayout(),
        tabletLayout: (context) => HomeTabletLayout(),
        desktopLayout: (context) => SizedBox(),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
