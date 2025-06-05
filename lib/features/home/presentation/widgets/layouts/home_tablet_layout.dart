import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/manager/categories_items/categories_items_cubit.dart';
import 'package:movies_app/features/home/presentation/widgets/layouts/home_bloc_providers.dart';
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
            child: CustomSearchField(
              onChanged: (value) {},
            ),
          ),
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
      ),
    );
  }
}
