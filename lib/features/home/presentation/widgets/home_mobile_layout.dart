import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/widgets/categorie_item.dart';

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
            child: CategorieItem(
              title: "All Categories",
              icon: Icons.category,
            ),
          ),
        ],
      ),
    );
  }
}
