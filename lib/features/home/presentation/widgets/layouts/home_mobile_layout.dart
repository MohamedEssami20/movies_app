import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/manager/home_search_cubit/home_search_cubit.dart';
import 'package:movies_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:movies_app/features/search/presentation/views/search_view.dart';
import '../categories_item_list_view.dart';
import '../custom_search_field.dart';
import 'home_bloc_providers.dart';

class HomeMobileLayout extends StatefulWidget {
  const HomeMobileLayout({super.key});

  @override
  State<HomeMobileLayout> createState() => _HomeMobileLayoutState();
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _HomeMobileLayoutState extends State<HomeMobileLayout> {
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
              if (homeStateNow == HomeStateNow.search) {
                return Expanded(child: SearchView());
              } else {
                return Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: CategoriesItemListView(),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Expanded(
                        child: HomeBlocProviders(),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
