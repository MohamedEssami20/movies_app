import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/cubits/cubit/check_internnet_connection_cubit.dart';
import 'package:movies_app/core/func/custom_snack_bar.dart';
import 'package:movies_app/core/services/get_it_service.dart';
import 'package:movies_app/features/home/presentation/widgets/home_layout.dart';
import 'package:movies_app/features/search/domain/search_repos/search_repos.dart';

import '../../../search/presentation/manager/search_cubit/search_cubit.dart';
import '../manager/categories_items/categories_items_cubit.dart';
import '../widgets/layouts/home_mobile_layout.dart';
import '../widgets/layouts/home_tablet_layout.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<InternetConnectionCubit, InternetConnectionState>(
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
    );
  }
}
