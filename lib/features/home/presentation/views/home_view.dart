import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/func/custom_snack_bar.dart';
import 'package:movies_app/core/services/get_it_service.dart';
import 'package:movies_app/features/home/presentation/manager/bottom_bar_cubit/bottom_bar_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/categories_items/categories_items_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/home_search_cubit/home_search_cubit.dart';
import 'package:movies_app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:movies_app/features/home/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:movies_app/features/home/presentation/widgets/home_layout.dart';
import 'package:movies_app/features/home/presentation/widgets/layouts/home_tablet_layout.dart';
import 'package:movies_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import '../../../../core/cubits/cubit/check_internnet_connection_cubit.dart';
import '../../../search/domain/search_repos/search_repos.dart' show SearchRepos;
import '../widgets/layouts/home_mobile_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeSearchCubit(),
      child: Scaffold(
        appBar: CustomAppBar(),
        body: BlocListener<InternetConnectionCubit, InternetConnectionState>(
          listener: (context, state) {
            if (state is InternetConnectionFailure) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              showAnimatedSnackBar(
                context,
                message: "No Internet Connection",
                type: AnimatedSnackBarType.error,
              );
            }
            if (state is InternetConnectionSuccess) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              showAnimatedSnackBar(
                context,
                message: "Internet Connection Restored",
                type: AnimatedSnackBarType.success,
              );
            }
          },
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CategoriesItemsCubit(),
              ),
              BlocProvider(
                create: (context) => SearchMoviesCubit(
                  searchRepos: getIt.get<SearchRepos>(),
                  context: context,
                ),
              ),
            ],
            child: HomeLayout(
              mobileLayout: (context) => HomeMobileLayout(),
              tabletLayout: (context) => HomeTabletLayout(),
              desktopLayout: (context) => SizedBox(),
            ),
          ),
        ),
        bottomNavigationBar: BlocProvider(
          create: (context) => BottomBarCubit(),
          child: CustomBottomNavigationBar(),
        ),
      ),
    );
  }
}
