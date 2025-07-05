import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/get_it_service.dart';
import 'package:movies_app/features/home/presentation/manager/bottom_bar_cubit/bottom_bar_cubit.dart';
import 'package:movies_app/features/home/presentation/manager/home_search_cubit/home_search_cubit.dart';
import 'package:movies_app/features/home/presentation/views/download_view.dart';
import 'package:movies_app/features/home/presentation/views/profile_view.dart';
import 'package:movies_app/features/watch_list/presentation/manager/cubit/watch_list_movies_cubit.dart';
import 'package:movies_app/features/watch_list/presentation/views/watch_list_view.dart';
import 'package:movies_app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:movies_app/features/home/presentation/widgets/custom_bottom_navigation_bar.dart';
import '../../../watch_list/domain/watch_list_repos/watch_list_repos.dart';
import 'home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const routeName = 'home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeSearchCubit(),
        ),
        BlocProvider(
          create: (context) => BottomBarCubit(),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(),
        body: BlocListener<BottomBarCubit, int>(
          listener: (context, state) {
            _pageController.animateToPage(
              state,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          },
          child: PageView(
            controller: _pageController,
            physics:
                const NeverScrollableScrollPhysics(), // فقط تغيير عبر bottom bar
            children: [
              HomeViewBody(),
              BlocProvider(
                create: (context) => WatchListMoviesCubit(
                  watchListRepos: getIt.get<WatchListRepos>(),
                ),
                child: WatchListView(),
              ),
              DownloadListView(),
              ProfileView(),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }
}
