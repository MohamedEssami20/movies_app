import 'package:flutter/material.dart';
import '../categories_item_list_view.dart';
import '../choosen_category_movies.dart';
import '../custom_search_field.dart';

class HomeMobileLayout extends StatelessWidget {
  const HomeMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: CustomSearchField(
              onChanged: (value) {},
            ),
          ),
        ),
        SliverToBoxAdapter( 
          child: SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CategoriesItemListView(),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: ChoosenCategoryViews(),
        ),
      ],
    );
  }
}





