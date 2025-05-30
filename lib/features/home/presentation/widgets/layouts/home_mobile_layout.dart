import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/manager/home_search_cubit/home_search_cubit.dart';
import 'package:movies_app/features/search/presentation/views/search_view.dart';
import '../categories_item_list_view.dart';
import '../custom_search_field.dart';
import 'home_bloc_providers.dart';

class HomeMobileLayout extends StatelessWidget {
  const HomeMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: CustomSearchField(
              onChanged: (value) {},
              onSubmitted: (value) {
                context.read<HomeSearchCubit>().enterSearchMode();
              },
            ),
          ),
          BlocBuilder<HomeSearchCubit, HomeSearchState>(
            builder: (context, state) {
              HomeStateNow homeStateNow = HomeStateNow.normal;
              if (state is HomeStateChanged) {
                homeStateNow = state.mode;
              }
              if (homeStateNow == HomeStateNow.search) {
                return SearchView();
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
