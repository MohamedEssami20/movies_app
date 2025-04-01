import 'package:flutter/material.dart';
import 'categories_item_list_view.dart';
import 'custom_search_field.dart';

class HomeMobileLayout extends StatelessWidget {
  const HomeMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverToBoxAdapter(
            child: CustomSearchField(
              onChanged: (value) {},
            ),
          ),
          SliverToBoxAdapter(
            child: const SizedBox(
              height: 24,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
              child: CategoriesItemListView(),
            ),
          ),
        ],
      ),
    );
  }
}


