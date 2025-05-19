import 'package:flutter/material.dart';
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
            ),
          ),
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
}
