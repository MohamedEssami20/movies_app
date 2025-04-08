import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/manager/bottom_bar_cubit/bottom_bar_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/categories_items/categories_items_cubit.dart';
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
      body: BlocProvider(
        create: (context) => CategoriesItemsCubit(),
        child: HomeLayout(
          mobileLayout: (context) => HomeMobileLayout(),
          tabletLayout: (context) => HomeTabletLayout(),
          desktopLayout: (context) => SizedBox(),
        ),
      ),
      bottomNavigationBar: BlocProvider(
        create: (context) => BottomBarCubit(),
        child: CustomBottomNavigationBar(),
      ),
    );
  }
}
