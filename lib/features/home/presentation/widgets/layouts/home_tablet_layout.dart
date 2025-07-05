import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/manager/categories_items/categories_items_cubit.dart';
import 'package:movies_app/features/home/presentation/widgets/layouts/home_bloc_providers.dart';
import 'package:movies_app/features/search/presentation/views/search_view.dart';
import '../../../../search/presentation/manager/search_cubit/search_cubit.dart'
    show SearchMoviesCubit;
import '../../manager/home_search_cubit/home_search_cubit.dart';
import '../categories_item_list_view.dart';
import '../custom_search_field.dart';

class HomeTabletLayout extends StatefulWidget {
  const HomeTabletLayout({super.key});

  @override
  State<HomeTabletLayout> createState() => _HomeTabletLayoutState();
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _HomeTabletLayoutState extends State<HomeTabletLayout> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: CustomSearchField(
                onChanged: (value) {},
                onSubmitted: (value) {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<HomeSearchCubit>().enterSearchMode();
                    context
                        .read<SearchMoviesCubit>()
                        .searchMovies(query: value!);
                  }
                },
              ),
            ),
          ),
          BlocBuilder<HomeSearchCubit, HomeSearchState>(
            builder: (context, state) {
              HomeStateNow homeStateNow = HomeStateNow.normal;
              if (state is HomeStateChanged) {
                homeStateNow = state.mode;
              }
              Widget child;
              if (homeStateNow == HomeStateNow.search) {
                child = const SearchView();
              } else {
                child = Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: BlocProvider(
                        create: (context) => CategoriesItemsCubit(),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: CategoriesItemListView(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Expanded(
                      child: HomeBlocProviders(),
                    ),
                  ],
                );
              }
              return Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: KeyedSubtree(
                    key: ValueKey(homeStateNow),
                    child: Column(
                      children: [
                        Expanded(
                          child: child,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
